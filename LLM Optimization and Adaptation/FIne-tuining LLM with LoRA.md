## Fine-Tuning LLM with LoRA for Domain Specific Task

Fine tuning an LLM useing Low Rank Adaptation (LoRA) is parameter efficient way to adapt the LLM to domain specific task given training data without training the whole model (all the parameters). LoRA technique introduces trainable parameters in form of low rank matrices and update them while keeping the original model parameters frozen. This method drastically reduces the number of parameters to be trained hence consuming less computational resources.

### LoRA intution

LoRA technique basically introduces new set of (low rank matrices) paramaters to train while keeping the original LLM paramaters frozen.

- Freeze the original model weights.
- Define small (copmared to the original model) and trainable parameter in form of low-rank matrices to the model architecture.
- Add these trained metrices to the original model parameters as an update.

Adjesting paramaters when fine tuning: $W_{new} = W + \Delta W$

where $W$ (orignial weights) is a $d \times d$ matrics.

LoRA introduces $A$ and $B$ low rank matrices which makes up (or approximate) the $\Delta W$: $ \Delta W = A \cdot B$

$A$ and $B$ be are two small matrices with size of $r \times d$ and $d \times r$, respectively, where $r$ is the ranking parameter for the approximation ($r << d$). The $r$ controls how much the model should adapt to the new task. Smaller $r$ means less parameters to train but limits the expressiveness.

Example Scenario:

- Imagine a LLM model has 1 million parameters version, which means $W: 1000 \times 1000 $ matrix ($d=1000$).
- Apply LoRA with $r =16$ whih means:
    - $A: 1000 \times 16$
    - $B: 16 \times 1000$
- This makes a the total number of trainable parameters: $ 1000 \times 16 + 16 \times 1000 = 32000$, which is way less than compared to 1 million paramters from $W$ (~3.2%).
- We train $A$ and $B$ on the new data and the wegith update for the model with LoRA: $W_{new} = W_{original} + A \cdot B$





