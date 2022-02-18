function Cx = mykron(A,B)
%https://algassert.com/impractical-experiments/2015/05/17/Treating-Controls-like-Values.html
% works only if B is I or X
[r1,c1] = size(A);
[r2,c2] = size(B);
% CX = zeros(r1*r2,c1*c2);
% if A
%     sprintf("here")
%     if B
        i=1; 
        for i1 = 1:r1
            for i2 = 1:r2
                j=1;
                for j1 =1:c1
                    for j2 =1:c2
                        [i1, i2, j1, j2];
                        c = controlled_product(A(i1,j1), B(i2,j2), i1, i2, j1, j2);
                        Cx(i,j) = c;
                        j = j+1;
                    end
                   
                end
                 i = i+1;
            end
        end
                
   
%     end
% end








% % % % [r1,c1] = size(A);
% % % % [r2,c2] = size(B);
% % % % 
% % % % 
% % % % for i = 1:r1
% % % %     for j = 1:c1
% % % %         if A(i,j)~=-1
% % % %             CX(2*(i-1)+1:2*i,2*(j-1)+1:2*j) = A(i,j)*B;
% % % %         else
% % % %             CX(2*(i-1)+1:2*i,2*(j-1)+1:2*j) = -eye(2);
% % % %         end
% % % %             
% % % %     end
% % % % end

end