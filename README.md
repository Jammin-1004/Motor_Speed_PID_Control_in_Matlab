# Motor Speed PID Control in MATLAB

## Overview
**PID Control** (Proportional-Integral-Derivative) is a control loop feedback mechanism widely used in industrial control systems. The primary goal of adjusting the P, I, and D gains (tuning) is to achieve a quick and stable response, often aiming for a **Critically Damped System** where the motor reaches the desired speed smoothly without oscillating.

## Tuning Methods

### 1. Manual Tuning (Most Common)
In manual tuning, the Proportional gain ($K_p$) is generally increased first until the system becomes **marginally stable** (starts to oscillate). Then, the Integral ($K_i$) and Derivative ($K_d$) gains are adjusted to stop the oscillations and eliminate steady-state errors.

<p align="center">
  <img src="https://upload.wikimedia.org/wikipedia/commons/3/33/PID_Compensation_Animated.gif" alt="PID Compensation Animated" width="500">
</p>
<p align="center"><i>Animation showing the effect of tuning P, I, and D parameters. (Source: Wikipedia)</i></p>

### 2. Ziegler-Nichols Method
This heuristic method provides a solid starting point and an acceptable closed-loop response. However, the gains obtained may not always be the absolute best. Therefore, you should perform final manual tuning to yield satisfactory control performance.

---

## Effects of Increasing a Parameter Independently

When manually tuning, it is crucial to understand how increasing each parameter affects the system's response:

| Parameter | Rise Time | Overshoot | Settling Time | Steady-State Error | Stability |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **$K_p$ (Proportional)** | Decrease | Increase | Small change | Decrease | Degrade |
| **$K_i$ (Integral)** | Decrease | Increase | Increase | Eliminate | Degrade |
| **$K_d$ (Derivative)** | Minor change | Decrease | Decrease | No effect in theory | Improve (if $K_d$ is small) |

## Result
