## Fine-Tuning LLM with LoRA for Domain-Specific Task

Fine-tuning an LLM using Low-Rank Adaptation (LoRA) is a parameter-efficient way to adapt the LLM to domain-specific tasks given training data without training the whole model (all the parameters). The LoRA technique introduces trainable parameters in form of low-rank matrices and update them while keeping the original model parameters frozen. This method drastically reduces the number of parameters to be trained hence consuming less computational resources.

### LoRA intuition
The LoRA technique introduces a new set of (low-rank matrices) parameters to train while keeping the original LLM parameters frozen.

- Freeze the original model weights.
- Define small (compared to the original model) and trainable parameters in form of low-rank matrices to the model architecture.
- Add these trained matrices to the original model parameters as an update.

Adjesting paramaters when fine tuning: $W_{new} = W + \Delta W$

where $W$ (orignial weights) is a $d \times d$ matrics.

LoRA introduces $A$ and $B$ low-rank matrices which makes up (or approximate) the $\Delta W$: $ \Delta W = A \cdot B$

$A$ and $B$ be are two small matrices with size of $r \times d$ and $d \times r$, respectively, where $r$ is the ranking parameter for the approximation ($r << d$). The $r$ controls how much the model should adapt to the new task. Smaller $r$ means less parameters to train but limits the expressiveness.

#### Example Scenario:

- Imagine an LLM model has a 1 million parameters version, which means $W: 1000 \times 1000 $ matrix ($d=1000$).
- Apply LoRA with $r =16$ which means:
    - $A: 1000 \times 16$
    - $B: 16 \times 1000$
- This makes the total number of trainable parameters: $ 1000 \times 16 + 16 \times 1000 = 32000$, which is way less than compared to 1 million parameters from $W$ (~3.2%).
- We train $A$ and $B$ on the new data and the weight update for the model with LoRA: $W_{new} = W_{original} + A \cdot B$

#### LoRA in Transformer layers in LLM (example)

In transformer-based LLMs (GPT and Llama), Lora is typically applied to attention layers: Query ($W_Q$) and Key ($W_K$) projection matrices:

Attention = softmax $(Q \cdot K^T) \cdot V$, where $Q = W_Q \cdot x$ and $K = W_K \cdot x$

When LoRA is applied:

$W_Q\rq = W_Q + A_Q \cdot B_Q$

$W_K\rq = W_K + A_K \cdot B_K$

During training $A_Q, B_Q, A_K$ and $B_K$ are trained.

### Practical scenario: please find the LoRA example for how to train an LLM ona  custom dataset [here](./finetune_with_LoRA_on_custom_dataset.ipynb)



