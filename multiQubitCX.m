function CX = multiQubitCX(n,cx)
% https://cs.stackexchange.com/questions/48834/applying-a-multi-qubit-quantum-gate-to-specific-qubits
% https://algassert.com/impractical-experiments/2015/05/17/Treating-Controls-like-Values.html

CX = 1;
CX1 = [-1, 0;0,1;];
x=[0 1;1 0;];
I=eye(2);
[rs,cs] = size(cx);
for i = 1:rs
    ctrl = cx(i,1);
    tar = cx(i,2:end);
    for j = 1:n
        if ismember(j,tar)
            CX = mykron(CX,x);
        elseif ~ismember(j,cx)
            CX = mykron(CX,I);
        elseif ismember(j,ctrl)
            CX = mykron(CX,CX1);
            
        end
    end
end
CX(CX==-1)=1;







% % % % % CX = [-1, 0;0,1;];
% % % % % x=[0 1;1 0;];
% % % % % I=eye(2);
% % % % % [rs,cs] = size(cx);
% % % % % for i = 1:rs
% % % % %     ctrl = cx(i,1);
% % % % %     tar = cx(i,2:end);
% % % % %     for j = 1:n
% % % % %         if ismember(j,tar)
% % % % %             CX = mykron(CX,x);
% % % % %         elseif j>1 && ~ ismember(j,tar)
% % % % %             CX = mykron(CX,I);
% % % % %         end
% % % % %     end
% % % % % end
% % % % % CX(CX==-1)=1;
end