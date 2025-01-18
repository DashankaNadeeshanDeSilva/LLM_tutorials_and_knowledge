## Feature Engineering

Feature engineering is selecting, creating/crafting and transforming features (or attributes) from data (raw or pre-processed) to imporve the outcome and interpretability of ML model. The fetaure engineeing process is an iterative (imporve based on performance) and often domain specific (depend on the outcome/task) process.

### Important aspects in feature engineering

- Feature creation: Generating new features from raw data. (e.g. From a datetime column, create : hour, day_of_week, and is_holiday features.)
- Feature Transformation: Converting features into more suitable/appropriate formats (e.g. Log-transforming skewed data or encoding categorical variables)
- Feature Selection: Identifying and retaining the most relevant features for the model. (techniques: Recursive Feature Elimination (RFE), Lasso Regularization, Mutual Information)
- Feature Extraction: Deriving new features from existing data or transforming data/attributes to get features that provides better insights to the model. (e.g. Principal Component Analysis (PCA) and t-SNE for visualization)
- Feature Scaling: For certain ML models (SVM and KNN) requires the numarical features to have comparable/compatible scales.
    - Normalization
    - Standerdization (Z-score)
    - Robust scaling: use madian and interquartile range to scalie features (robust against outlieres)
    - Logs scaling: Applies log(1+X) to compress skewed distributions.


