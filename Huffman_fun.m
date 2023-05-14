function [code1, average_length] = Huffman_fun(p1)      
% p1 - probability vector 
% code1 - corresponds codewords
% average_length is the expected codeword length 

% check if p1 is row vector or column vector
if ((sum(p1>=0)~=length(p1)))
    error('Enter a probability vector');
end

[pdes,idx] = sort(p1); % sort in ascending order and keeping the index

if(length(p1)>2)    %number of symbols are greater than 2 
    q1_sum = sum(pdes(1:2));  % summing the least two probabilities
    old_code1 = {'1', '0'};   % assigning 0 or 1 for each branch
    pdes = [q1_sum pdes(3:end)];  % removing the least two probailities and adding their sum 
    old_code2 = Huffman_fun(pdes);  % recurrsive calling the Huffman function 
    code_sum = old_code2(1);  % extracting the first code 
    old_code2(1) = [];  
    new_code1 = [strcat(code_sum,old_code1) old_code2]; % concatinating the code of sum to the code of the two old probabilities of this sum ,
                                                        % then appending the other retrived codes from huffman function 
    code1(idx) = new_code1;     % Assigning the code with its original indecies
    
elseif(length(p1)==2)     % Base Case
code1(idx) = {'1', '0'};     % Assigning the code with its original indecies
end

length1 = cellfun(@length, code1);
average_length = sum(length1.*p1);
end
