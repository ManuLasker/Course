function [bestEpsilon bestF1] = selectThreshold(yval, pval)
%SELECTTHRESHOLD Find the best threshold (epsilon) to use for selecting
%outliers
%   [bestEpsilon bestF1] = SELECTTHRESHOLD(yval, pval) finds the best
%   threshold to use for selecting outliers based on the results from a
%   validation set (pval) and the ground truth (yval).
%

bestEpsilon = 0;
bestF1 = 0;
F1 = 0;

stepsize = (max(pval) - min(pval)) / 1000;
for epsilon = min(pval):stepsize:max(pval)
    
    % ====================== YOUR CODE HERE ======================
    % Instructions: Compute the F1 score of choosing epsilon as the
    %               threshold and place the value in F1. The code at the
    %               end of the loop will compare the F1 score for this
    %               choice of epsilon and set it to be the best epsilon if
    %               it is better than the current choice of epsilon.
    %               
    % Note: You can use predictions = (pval < epsilon) to get a binary vector
    %       of 0's and 1's of the outlier predictions

    predictions = (pval < epsilon); %these are the anomalies 
    %First form couse I din't know about and and or
    tp_plus_fp = sum(predictions); %get tp+fp
    %disp(tp_plus_fp);
    
    %%fn_plus_tn = sum(predictions==0);%get fn +tn
    %disp(fn_plus_tn);
    %difference between the predictions and the real label
    %%temp = predictions - yval;
    
    %get all the needed arguments
    %%fp = sum(temp == 1);
    %disp(fp);
    
    %%fn = sum(temp == -1);
    %disp(fn);
    
    %%tp = tp_plus_fp - fp;
    %disp(tp);
    %%GETTING tp, fn in another way
    tp = sum((predictions == 1) & (yval == 1));
    fn = sum((predictions == 0) & (yval == 1));
    
    prec = tp/(tp_plus_fp);
    rec = tp/(tp + fn);
    
    F1 = 2* prec*rec/(prec+rec);



    
    % =============================================================

    if F1 > bestF1
       bestF1 = F1;
       bestEpsilon = epsilon;
    end
end

end
