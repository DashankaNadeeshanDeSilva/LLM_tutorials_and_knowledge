
Word embeddings

Definition: In the NLP domain, converting words to or representing words in real-valued vectors (often multi-dimensional) is commonly referred to as word embeddings. This basically gives the ability to computers to understand and learn about text-based content in a better and productive way. There exist many word embeddings methods and techniques, which can be mainly categorize into two types: statistical and contextual word embeddings.

### Traditonal Embedding Techniques

- One-hor-encoding
- Bag of words
- TF-IDF (Term Frequency-Inverse Document Frequency)
- Word2Vec
- Glove (Global Vectors for Word Representation)
- FastText

### Contextual Embedding Techniques

- ELMo (Embeddings from Language Models)

#### Transformer-Based Embeddings:

- BERT (Bidirectional Encoder Representations from Transformers)
    Description: Uses a bidirectional transformer architecture to capture contextualized embeddings.
    
    Key Features: 
    - Dynamic embeddings based on context.
    - Pretrained on masked language modeling and next sentence prediction tasks.

- GPT (Generative Pre-trained Transformer)
    Description: Focuses on autoregressive language modeling.
    
    Key Features:
    - Embeddings are generated during the text generation process.

- Transformer Variants: RoBERTa, DistilBERT, ALBERT, T5, GPT-3, LLaMA, etc., refine and extend BERT and GPT architectures.