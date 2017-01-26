% Function:
% Perform compact inversion on gravity anomaly

%% Step 1: get parameters and variables
global A G_obs l_0 iter_max V_inv G_model uplim lowlim toggle Zmid Xmid...
    xspace zspace disp_interm




%% Step 2: calculation preparations
[m,n]=size(A);
I_n=eye(n); I_m=eye(m); %identity matrices
epsilon=10^(-8);
interm_iter=zeros(n,1,4);  % store for illustration of intermediate iteration result
iter_s=floor(iter_max/4);
twonorm=zeros(1,iter_max); % store L2 norm

%% Step 3: creat initial model

% Creat weighting matrice
W_v_inv=I_n;               %density weighting is identity matrix
D=A*(W_v_inv)*A';          %problem NaN
W_e_inv=diag(diag(D));     %error weighting is identity marix

iteration=(1:iter_max);


% damped-weighted least square solution
int=(A*W_v_inv*A' + W_e_inv)\G_obs;   %intermediate vector
V=W_v_inv*A'*int;

% save for illustration of intermediate iteration result
interm_iter(:,:,1)=V;

% Iteration parameters
G_r_prev=G_obs;   % G_r_prev = reduded gravity, which equal to G_obv for initial model
l_0_prev=l_0;    % l_0_prev = reduced
%% Step4:Iteration loop
% USe different inversion procedures depending on whether density limit is set

if toggle==0  %radiobutton with tag: radiobutton_limit is empty, value=0
    % Inversion with no upper or lower limit
    
    h=waitbar(0,'Iterations');
    for iter=1:iter_max
        
        %Step 4.1: waitbar
        waitbar(iter/iter_max);
        
        %Step4.2: Matrix needed for least square sol.
        %%density weighting matrix
        W_v_inv=diag(V.^(2)+epsilon);
        
        %%error weighting matrix
        D=A*W_v_inv*A';
        W_e_inv=(l_0^2)*diag(diag(D));
        
        
        
        %Step4.3: Damped weighted least square formula
        inv=(A*W_v_inv*A' + W_e_inv)\G_obs;
        V=W_v_inv*A'*inv;
        
        %Step4.4: calculate the norm
        residue=G_obs-A*V;
        twonorm(iter)=norm(residue);
        
        

        %Step4.5:store matrix after each iterations for display
            if iter==iter_s
                interm_iter(:,:,2)=V;
            elseif iter==2*iter_s
                interm_iter(:,:,3)=V;
            elseif iter==3*iter_s
                interm_iter(:,:,4)=V;
            end
            
    end
    close(h);
    
    
elseif toggle==1  %radiobutton with tag: radiobutton_limit is filled, value=1
    % inversion with limit target density range
    
    
    % For the sake of stability, avoid setting any limits too close to zero
    if uplim<10 && uplim >= 0
        uplim=10;
    end
    
    if lowlim>-10 && lowlim <=0
        lowlim=-10;
    end
    
    h=waitbar(0,'Iterations');
    for iter=1:iter_max
        
        %Step4.1: waitbar
        waitbar(iter/iter_max);
        
        
        %Step4.2: subtract the gravity effect of blocks that cross the upper density limit
        
        % Check
        if uplim<lowlim
            error('lower limit is larger than upper limit');
            
        end
        
        
        
            %multiply unit Heaviside step function H(Vj/uplim) to Vj
            v_up=V;
            v_up(v_up<=uplim)=0;   % Vj < uplim, become 0
            v_up(v_up>uplim)=1;  % uplim < Vj, become 1
            
            %%%% Caution!!!!!!
            %%%% It is essential to perform v_up(v_up<uplim)=0 in front of v_up(v_up>=uplim)=1
            %%%% otherwise all become zero!
            G_r=G_obs-uplim*A*v_up; % subtract gravity effect due to blocks that >= uplim
            
            
            v_low=V;
            v_low(v_low>=lowlim)=0;   % Vj > lowlim, become 0
            v_low(v_low<lowlim)=1;  % lowlim > Vj, become 1
            %%%% Caution!!!!!!
            %%%% It is essential to perform v_low(v_low<uplim)=0 in front of v_low(v_low>=uplim)=1
            %%%% otherwise all become zero!
            G_r=G_r-lowlim*A*v_low; % subtract gravity effect due to blocks that <= lowlim
            
            
            
            %Step4.3: density weighting function
            H=1-v_up-v_low;
            W_v_inv=diag( (diag(V.^(2))*H +epsilon) );
            
            
            
            %Step4.4: error weighting function
            l_0=l_0_prev*(max(G_r_prev-G_obs+A*V))/(max(G_r-G_obs+A*V));
            
            D=A*W_v_inv*A';
            W_e_inv=(l_0)^2*diag(diag(D));
            
            
            %Step4.5: least square solution
            
            inv=(A*W_v_inv*A' + W_e_inv)\G_r;
            V=W_v_inv*A'*inv + uplim*v_up + lowlim*v_low;
            
            %Step4.6: save parameters for next iteration
            G_r_prev=G_r;   % G_r_prev = reduded gravity, which equal to G_obv for initial model
            l_0_prev=l_0;
            
            
            %Step4.7: calculate the norm
            residue=G_obs-A*V;
            twonorm(iter)=norm(residue);
            
            

            
            %Step8:store matrix after each iterations for display
            if iter==iter_s
                interm_iter(:,:,2)=V;
            elseif iter==2*iter_s
                interm_iter(:,:,3)=V;
            elseif iter==3*iter_s
                interm_iter(:,:,4)=V;
            end
            
            
        
    end
    close(h);
    
end



%Plot the 2-norm against iteration
figure(1)
plot(iteration,twonorm)
legend('L2 norm of misfit');



% Plot intermediate iteration results if 'Show intermediate iterations is clicked'
if disp_interm==1
    figure(2)
    iterm=zeros(CZ,CX,4);
    load invG_colormap.mat %Load the special gravity/magnetics colormap
    
    for k=1:4
        subplot(2,2,k)
        
        iterm(:,:,k)=reshape(interm_iter(:,:,k),CZ,CX);
        imagesc(Xmid(1,:),Zmid(:,1)',iterm(:,:,k));   %display matrix as image, but with scaled bar
        set(gca,'XAxisLocation','top','XTick',xspace, 'YTick',zspace);
        grid on
        

         if k==1 % the first iteration to be displayed is the 1st iteration
            title('The 1 st iteration');
        else
            str=sprintf('The %d th iterations',(k-1)*iter_s);
            title(str)
        end
               
        colormap(mycamp)
        caxis([-300 300])
        colorbar('southoutside')
        axis('ij');
        
    end

end









% Calculate modeleed gravity response
G_model=A*V;

% Reshape the density model matrix from
V_inv=reshape(V,CZ,CX);