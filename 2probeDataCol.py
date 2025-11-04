import numpy as np
import srlock

res = "GPIB0::8::INSTR"

with srlock.SR830(resource=res, timeout=10000) as lia:
    print("IDN:", lia.idn())  # IDN?
    lia.outx(1)  # ensure responses to GPIB
    print("Current phase (deg):", lia.phas())  # PHAS?
    lia.fmod(1)  # internal reference
    print("Freq set, read back:", lia.freq())
