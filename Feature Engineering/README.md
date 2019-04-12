# README
This feature engineering part includes:
1. Apply onehot to categorical variables.
2. Merge all independent variables into one datset call "x-1316" after using onehot.
3. Apply z-score normalization to all continuous variables in dataset "x-1316".
4. Apply smote-nc method to all imbalanced dependent variables. However, dependent variables of sexual disease and diabetes are already balanced, so we do not need to apply smote-nc on both of them.  
