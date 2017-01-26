%%%%%%%%%%%%%%%%%%%%%% kernel.m %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Function:
%compute the kernel for forward modelling and inversion

% num_data=number of data=M, num_model=number of models=N
global Xmid Zmid num_model num_data xx dz dx A


G=6.67384e-11;
disp('Computing kernel');
tic

        %reshape the x and z vector of mid point of prisms to (1xnum_model)
        xi=xx;
        h=dz;
        d=dx;
        xj=reshape(Xmid, 1,num_model);
        zj=reshape(Zmid, 1,num_model);
        
        A=zeros(num_data,num_model);   % kernel A is MxN matrix
        
        % aij are elements of A
        % aij = influence of the j-th prism on the i-th gravity value
        

        for ii=1:num_data   %compute A row by row
            x=xi(ii);  % x coordinate of measurement point
            
            r1=( (zj-h/2).^2 +(x-xj+d/2).^2 ).^0.5;
            r2=( (zj+h/2).^2 +(x-xj+d/2).^2 ).^0.5;
            r3=( (zj-h/2).^2 +(x-xj-d/2).^2 ).^0.5;
            r4=( (zj+h/2).^2 +(x-xj-d/2).^2 ).^0.5;
            
           
            % Prevent any r equals to zeros
            if any(r3==0)==1
                r3(r3==0)=eps;
            end
            
            if any(r1==0)==1
                r1(r1==0)=eps;
            end
            
            if any(r2==0)==1
                r2(r2==0)=eps;
            end
            
            if any(r4==0)==1
                r4(r4==0)=eps;
            end
            

            theta1=atan( (x-xj+d/2)./(zj-h/2) );
            theta2=atan( (x-xj+d/2)./(zj+h/2) );
            theta3=atan( (x-xj-d/2)./(zj-h/2) );
            theta4=atan( (x-xj-d/2)./(zj+h/2) );
            
            theta1(isnan(theta1))=pi/2;   % if (x-xj+d/2)./(zj-h/2) = 0/0 atan => NaN
            theta3(isnan(theta3))=pi/2;
            
            

            
            
            
            Ai=2*G*( (x-xj+d/2).*log((r2.*r3)./(r1.*r4)) + d.*log(r4./r3)...
               -(zj+h/2).*(theta4-theta2) + (zj-h/2).*(theta3-theta1) )*(10^5);
            
            A(ii,:)=Ai;
        end
        
        
        %Test if there is NaN or Inf
        %A
        %find(isnan(A)==1)
        %find(isinf(A)==1)
        
toc