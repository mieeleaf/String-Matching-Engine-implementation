

# String Matching Engine (SME) - High-Performance Hardware Architecture

## 🏆 Project Achievements

* **Ranking:** 1st Place / 37 Teams
* **Total Score:** 108 / 100 (Full marks + bonus points) 


* **Score Breakdown:**
* Functionality & Performance: 40/40
* Hardware Performance Bonus: 13/15
* Algorithm Design: 10/10
* Circuit Architecture: 10/10 





## 1. The Challenge: Breaking the Algorithmic Deadlock

In the early stages of the project, our team hit a major impasse regarding algorithm selection. Half of the team strongly advocated for **Boyer-Moore (BM)** or **DFA-based** approaches, assuming their theoretical time-complexity advantages in software environments would translate directly to hardware efficiency.

**The Insight:** I questioned whether these "advanced" software algorithms were truly suitable for our specific hardware constraints, such as short pattern lengths and small alphabet sizes. I suspected that the complex control logic required for BM would lead to excessive gate counts and critical path delays, ultimately hindering performance.

## 2. Leadership & Methodology: Data-Driven Decision Making

To resolve the conflict, I pivoted the team from subjective debate to a rigorous engineering-based evaluation: **"Literature Review → Modeling → Data-Driven Decisions."**

* **Step 1: Literature Review:** We identified a gap in existing research; while software complexity is well-documented, hardware implementation data (Area/Timing) for ASIC/FPGA is scarce.
* **Step 2: Python-based Hardware Modeling:** I developed a custom Python simulator to model hardware behavior before writing a single line of Verilog.
* **The Innovation:** I didn't just test for logical correctness; I introduced hardware cost proxies—such as **Comparator Width**, **Fan-out**, and **Register Count**—to act as indicators for Delay and Area.
* **The Discovery:** The simulation revealed that under our specific constraints, the "Naïve" approach actually outperformed Boyer-Moore. Its simpler control logic resulted in a much shorter Critical Path.



## 3. Technical Innovation: The MHH Fully Parallel Architecture

Based on the simulation results, I proposed a high-concurrency architecture: **MHH (Fully Parallel Architecture).**

* **Design Principle:** Although the logic depth is increased, this architecture enables a **Single-Cycle** match across all characters simultaneously.


* **The Results:** This design reduced the cycle count to **1/3** of the Naïve algorithm and **1/5** of the Boyer-Moore implementation.



## 4. Performance Data (TSMC 0.13 um)

*Clock Period: 20 ns* 

| Metric | Boyer-Moore (BM) | Naïve | **MHH (Final)** |
| --- | --- | --- | --- |
| Cell Area () | 27881.49 | 26949.61 | 27177.07 |
| Gate Count | 5576 | 5389 | 5435 |
| Total Cycles | 2298 | 1621 | **503** |
| Dynamic Power (mW) | 0.437 | 0.446 | 0.513 |
| **Performance Score** | 0.0156 | 0.0228 | **0.0732** |

Note: Performance Score is calculated as .

## 5. Verification & QA

* **Accuracy:** Passed 100/100 test patterns in both RTL (Pre-synthesis) and Gate-level (Post-synthesis) simulations.


* **Regex Support:** Fully supports `^` (Start), `$` (End), `.` (Wildcard), and `*` (Zero or more occurrences).


* **Static Checks:** Verified via **RealIntent Spyglass** (Lint check) and optimized for high code coverage.



## 6. Team Members & Contributions

* **黃麗穎 (B103012034):** Algorithm Development, RTL Coding, Circuit Synthesis, and Waveform Debugging.
* **葉米亞 (B103015019):** Algorithm Development, RTL Coding, Waveform Simulation, RTL Writing, Power Analysis, Synthesis, and Report Preparation.
* **蕭家妮 (B093011025):** Report Preparation, Hardware Architecture Performance Analysis, and Code Coverage Evaluation.

---

*This project was completed as the Final Project for the "Practical Digital System Design" course.*
