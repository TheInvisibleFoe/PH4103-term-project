== Introduction
A lock-in amplifier is a type of amplifier that can extract a signal from an extremely noisy 
input. Generally, the signal we are trying to extract has a known carrier signal, i.e. a known
frequency. The signal to noise ratio upto which we can reliably detect the target signal depends
on the dynamic reserve of the instrument. For our experiments, we used Stanford Research Systems' 
Model SR830 DSP Lock-In Amplifier. As a DSP (Digital Signal Processor) lock-in amplifier, the SR830
performs most of it's core funcitons digitally, leading to a better performance than it's analog
competitors. In the following section, we describe the workings of this amplifier in greater
detail.

== Working Principle
The core function that the lock-in amplifier performs, is #emph("Phase Sensitive Detection"). 
Let's say the input signal we provide is $V_i (t) = V_0 sin(omega_i t + phi_i)$. The lock-in 
multiplies this signal with another reference signal, often provided by an internal oscillator.
Let's say the reference sinusoidal signal is given by $V_r (t) = V_1 sin(omega_r t + phi_r)$. Note
that both $omega_r$ and $phi_r$ of this internal oscillator are tunable parameters. After multiplying
these to signals, we get
$
V_"psd" (t) &= V_i (t)V_r (t) \ 
            &= V_0V_1sin(omega_i t + phi_i)sin(omega_r t + phi_r) \
            &= 1/2 V_0V_1 [cos[(omega_i - omega_r)t + (phi_i - phi_r)] - cos[(omega_i + omega_r) + (phi_i + phi_r)]]
$
As we can see, we end up with two different sinusoidal components. If $omega_i = omega_r$, then we 
end up with an oscillating AC signal at frequency $2omega_r$ and a DC offset signal. If we now 
send this signal through a low pass filter (or equivalently take a time average of the signal), 
we will end up with just the DC signal, which from our calculations turns out to be, 
$
V_"lpf" = 1/2 V_0V_1cos(Delta phi) 
$

Where $Delta phi = phi_i - phi_r$, can be adjusted to 0 by setting $phi_r = phi_i$. The output 
of the low pass filter can then be scaled down by $1/2 V_r$, and we finally end up with the output voltage
of $V_"out" = V_0$. Note that it's not necessary that the input signal is a pure sinusoid. Infact, 
most of the times it will not be one. 

#figure(
    image("PSD.png", width: 70%),
    caption: [Schematic diagram of a Phase Sensitive Detector (Credits: Zelbear on Wikipedia)],
)
#pagebreak()
We can use the lock-in amplifier to extract all the fourier components of
the target signal at the reference frequency. To do this, the lock-in performs the calculation
we just described, twice in the two quadratures by using a $90 degree$ phase shifted copy of the reference signal.
It's better explained by this schematic diagram shown below.

#figure(
    image("lockin_block_diagram.png", width: 60%),
    caption: [Schematic Diagram for the SR830 Lock-In Amplifier (Credits: Stanford Research Systems)],
)

And the end of this process, we end up with two signals, $X$ and $Y$, which correspond to the $sin$ and 
$cos$ quadratures of the signal respectively. The lock-in also calculates two other variables $R$ and $theta$ as 
$
R = sqrt(X^2 + Y^2)
$
$
theta = arctan(Y/X)
$

== Core Blocks and Specifications of the SR830
In this section we describe the core blocks of the SR830 lock-in amplifier, along with the various
specifications and available values for the adjustable parameters in those blocks. Below is an
image of the front-panel of the SR830.
#figure(
    image("lockin_front.jpg", width:50%),
    caption: [Front Panel of the SR830 (Credits: Stanford Research Systems)],
)
=== Input
=== Reference
=== Filters
