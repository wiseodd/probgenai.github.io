---
title: ""
slug: /
---

# CS 9840: Probabilistic Generative AI

Summarized course website for CS 9840: Probabilistic GenAI, Winter 2026.
Students will learn the **theoretical foundations** for generative AI.

> From chatbots to image generators, Generative AI (GenAI) is reshaping the world. What algorithms and probabilistic principles power this revolution?
> This course introduces the theoretical and algorithmic foundations of GenAI, covering large language models (LLMs) and diffusion models, among more mature methods.
> We will also explore applications in AI for Science, such as drug discovery and weather forecasting.

:::info

Detailed course information is on [OWL Brightspace](https://westernu.brightspace.com/d2l/home/168599) (available starting December 2025) and the [course outline](/cs9840-courseoutline-W2026.pdf).
:::

### Prerequisites

There are no formal prerequisites.
But, since GenAI is inherently probabilistic, some knowledge of the following is necessary.

:::tip

There will be review sessions (Weeks 1 & 2).
However, students who are not comfortable with these concepts are **highly encouraged** to independently read the [D2L book, Chapter 2](https://d2l.ai/chapter_preliminaries/index.html).

:::

- **Probability/statistics:**
  - sum, product, and Bayes' rule,
  - probability distributions (Gaussians, Categorical),
  - maximum likelihood.
- **Linear algebra:**
  - vectors and matrices,
  - matrices/vectors products,
  - matrix inversion.
- **Multivariable calculus:**
  - partial derivatives, gradients, Jacobians, & Hessians,
  - multivariable integration.
- **Machine learning:**
  - regression, classification,
  - neural networks,
  - gradient descent,
  - familiarity with deep learning libraries (code examples are in PyTorch).

## Schedule

:::info

- **Lecture:** Tuesdays, 10 AM–12 PM.
- **Tutorial:** Thursdays, 12:30 PM–1:30 PM.
- **Office hour:** Thursdays, 1:30 PM–3:00 PM.

:::

<br />

| Week | Date   | Lecture (Tue)                            | Tutorial (Thu)                                     | Resources                                                                             |
| ---- | ------ | ---------------------------------------- | -------------------------------------------------- | ------------------------------------------------------------------------------------- |
| 1    | Jan 6  | Introduction, probability review, admins | Linear algebra & calculus review                   | Bishop 2024, Chapters 2 & 3; D2L, Chapter 2                                           |
| 2    | Jan 13 | Variational autoencoders                 | Neural networks review                             | Bishop 2024, Chapter 19; D2L, Chapter 2                                               |
| 3    | Jan 20 | Explicit and implicit likelihood models  | HW 1                                               | Bishop 2024, Chapters 17 & 18                                                         |
| 4    | Jan 27 | Application: De novo molecular discovery | HW 2                                               | Kristiadi 2025, Chapter 1; Garnett 2023, Chapter 1; Gómez-Bombarelli et al., ACS 2018 |
| 5    | Feb 3  | Diffusion Models I: Introduction         | Project info session                               | Bishop 2024, Chapter 20                                                               |
| 6    | Feb 10 | Diffusion Models II: Advanced Topics     | Project proposal deadline & project Q&A            | Bishop 2024, Chapter 20                                                               |
| 7    | Feb 17 | **Reading week**                         | **No classes**                                     |                                                                                       |
| 8    | Feb 24 | Application: Climate modeling            | HW 3                                               | Price et al., Nature 2025                                                             |
| 9    | Mar 3  | LLMs I: Architectures                    | Stylistic scientific writing & how to research 101 | Bishop 2024, Chapter 12; D2L Chapter 11                                               |
| 10   | Mar 10 | LLMs II: Decoding and reasoning          | HW 4                                               | Bishop 2024, Sec. 12.3.2; D2L Sec. 10.8; Lightman et al., ICLR 2023                   |
| 11   | Mar 17 | LLMs III: Finetuning and alignment       | Selected topics in GenAI                           | Bishop 2024, Chapter 12; Steinnon et al., NeurIPS 2020; Hu et al., ICLR 2022          |
| 12   | Mar 24 | Project presentations                    | Project presentations                              |                                                                                       |
| 13   | Mar 31 | Project presentations                    | Project presentations                              |                                                                                       |

<br />

:::info

- HW 1-4 must be submitted the midnight before the corresponding tutorial. For example, HW 1 must be submitted by Wednesday, Jan 21, 11:59 PM.
- Project proposal must be submitted by Wednesday, Feb 12, 11:59 PM.
- Project presentation slides must be submitted by Monday, Mar 23, 11:59 PM. The presentation order will be drawn randomly.
- Project final report must be submitted by Thursday, Apr 9, 11:59 PM.

:::

## References

1. Bishop, "Deep Learning: Foundations and Concepts", Springer, 2024. [[Link]](https://www.bishopbook.com/)
2. Zhang, Lipton, Li, and Smola, "Dive into Deep Learning (D2L)". [[Link]](https://d2l.ai)
3. Garnett, Roman, "Bayesian Optimization", Cambridge University Press, 2023. [[Link]](https://bayesoptbook.com/)
4. Kristiadi, Agustinus, "Introduction to the Analysis of Probabilistic Decision-Making Algorithms", 2025. [[Link]](https://arxiv.org/abs/2508.21620)
5. Gómez-Bombarelli, et al., "Automatic chemical design using a data-driven continuous representation of molecules", ACS Central Science 4(2), 2018. [[Link]](https://pubs.acs.org/doi/10.1021/acscentsci.7b00572)
6. Price, et al., "Probabilistic weather forecasting with machine learning", Nature 637(8044), 2025. [[Link]](https://www.nature.com/articles/s41586-024-08252-9)
7. Stiennon, et al., "Learning to summarize with human feedback", NeurIPS, 2020. [[Link]](https://arxiv.org/abs/2009.01325)
8. Lightman, et al., "Let's verify step by step." ICLR. 2023. [[Link]](https://arxiv.org/abs/2305.20050)
9. Hu, et al., "LoRA: Low-rank adaptation of large language models", ICLR, 2022. [[Link]](https://arxiv.org/abs/2106.09685)

## Grading

Students will be asked to form groups of 2 in the early weeks of the course.
All homeworks and project are to be done in group.
Homework assignment sheets will be available on OWL Brightspace.
Refer to the [course outline](/cs9840-courseoutline-W2026.pdf) for detailed information.

| Type                       | Weight | Count | Total    |
| -------------------------- | ------ | ----- | -------- |
| Homework                   | 10%    | 4     | 40%      |
| Project Proposal           | 15%    | 1     | 15%      |
| Project Final Presentation | 20%    | 1     | 20%      |
| Project Final Report       | 25%    | 1     | 25%      |
| **Total**                  | **-**  | **-** | **100%** |

## Policies

- GenAI such as LLM chatbots **must not** be used to generate HW solutions and reports/slides.
- Acceptable use of GenAI: (Must be disclosed as at the end of each document.)
  - Grammar correction.
  - "Study Mode": [https://openai.com/index/chatgpt-study-mode/](https://openai.com/index/chatgpt-study-mode/).
- Late submissions will **not** be marked since HWs and project are done in a group.

Refer to the [course outline](/cs9840-courseoutline-W2026.pdf) for more info and other polices.
