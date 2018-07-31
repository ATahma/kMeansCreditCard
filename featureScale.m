% Perform Feature Scaling For our chosen features 

% min - max normalization to place values between 0-1

% Takes in vectors
function NormData = featureScale(Data)
  % find min and max 
  mx = max(Data);
  mn = min(Data);
  
  NormData = (Data - mn) ./ (mx - mn );
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
endfunction
