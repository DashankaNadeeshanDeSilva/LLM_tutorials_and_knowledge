## Feature Engineering

Feature engineering is selecting, creating/crafting and transforming features (or attributes) from data (raw or pre-processed) to improve the outcome and interpretability of the ML model. The feature engineering process is an iterative (improved based on performance) and often domain-specific (depending on the outcome/task) process. The following are important aspects of feature engineering:

- Feature creation: Generating new features from raw data. (e.g. From a DateTime column, create: hour, day_of_week, and is_holiday features.)
- Feature Transformation: Converting features into more suitable/appropriate formats (e.g. Log-transforming skewed data or encoding categorical variables)
- Feature Selection: Identifying and retaining the most relevant features for the model. (techniques: Recursive Feature Elimination (RFE), Lasso Regularization, Mutual Information)
- Feature Extraction: Deriving new features from existing data or transforming data/attributes to get features that provide better insights to the model. (e.g. Principal Component Analysis (PCA) and t-SNE for visualization)
- Feature Scaling: For certain ML models (SVM and KNN) requires the numerical features to have comparable/compatible scales.
    - Normalization
    - Standardization (Z-score)
    - Robust scaling: use median and interquartile range to scale features (robust against outliers)
    - Logs scaling: Applies log(1+X) to compress skewed distributions.
- Feature Store: is a centralized repository for storing and managing features to ensure consistency and reusability over different ML models and workflows (suitable for collaborated workflows). This also provides the monitoring and tracking capabilities of the impact of features on models. (e.g. Snowflake and AWS SageMaker)
- Data preprocessing related: pre-processing is an important step in feature engineering to ensure data used to create features are of good quality in many aspects.
    - Cleaning and handling missing values.
    - Categorical feature handling (one-hot encoding).
    - Outlier detection and treatment (DBSCAN for anomaly detection).
- Feature importance analysis: Identify and realize feature importance and prominence to focus on selecting the best features and addressing trade-offs. Explainable AI techniques are often used e.g. SHAP, LIME and Permutation importance.
