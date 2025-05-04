COMPUTATIONAL METHODS FOR DIGITAL COMMUNICATIONS

[KNOPP Raymond](https://www.eurecom.fr/en/people/knopp-raymond)

### ABSTRACT

Computational methods in digital communications provide a selection of hands-on experiments in programming and implementation techniques for high-performance computing applied to telecommunications. Students will learn architecture concepts and how to optimize software to efficiently implement different types of algorithms on software-based systems.

`Pedagogical Outcomes`: Students will gain knowledge of some generic digital programming methods and a deeper understanding of a topic in the context of a mini-project. They will also learn to work in teams and to synthesize their understanding through a presentation at the end of the course in front of all students.

`Teaching and Learning methods`:  Lectures and lab. sessions.

`Course Policies`: Attendance at practical sessions and mini-project meetings is mandatory.

### BIBLIOGRAPHY

Documents (plates, public documents on the internet) provided to students.

### REQUIREMENTS

“Computer Programming” (ComProg) and “Computer Architecture” (CompArch).

### DESCRIPTION
 

1. The first exercise familiarizes the students with programming or designing an implementation with fixed-point processing and in particular dealing with the degradation of an algorithm due to the effects of finite word length and saturated arithmetic. The students analyze the fast Fourier transform for two fixed-point arithmetic configurations using a C-language testbench. One configuration is representative of a digital signal processor while the other is of the arithmetic logic units found in a typical field-programmable gate array (FPGA).

2. The second exercise covers optimization techniques using single-instruction multiple-data (SIMD) parallelization extensions in x86-64 or ARM architectures. The students implement a simple component-wise vector multiplication for long vectors and experiment with optimization techniques to achieve the maximum performance of the architecture.

The exercise highlights methods to analyze the runtime performance of a software implementation. Moreover, students will learn how to inspect the choices of a compiler to fine-tune its optimization strategy and ultimately improve the performance of the final result.

3. The mini-projects allow the students to form groups to study a particular larger problem through a team effort. Regular meetings with the instructor and teaching assistants are organized to guide the students and analyze their progress. Subjects vary from year-to-year but can include:

- Real-time signal acquisition and processing.
- GPU-based implementations
- Parallel computing on a modern container-based multi-server switching fabric
- Real-time performance analysis
- SIMD acceleration on embedded ARM computers

`Learning Outcomes`: 

* The students obtain a basic understanding of some numerical programming methods and a more detailed understanding of one topic considered in their mini-project.
* They also will learn to work in a team environment on the mini-project and to synthesize their understanding through a presentation to their peers at the end of the course.

`Nb hours`: 42 hours.

`Evaluation`: 

- Final mini-project work and presentation (50% of the final grade),
- Lab. reports (50% of the final grade).
