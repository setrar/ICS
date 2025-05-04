

# translating get_num_samps_and_done.py from Python to Julia using ChatGPT

# Here is the equivalent code in Julia using the `LibUHD.jl` package, which is a Julia wrapper for the UHD library:

using LibUHD
using FFTW
using LinearAlgebra

# Create the USRP object
usrp = UHD.MultiUSRP("type=b200")  # ("addr=192.168.80.55")

# Set up parameters
usrp.set_rx_rate(7.68e6)
usrp.set_rx_freq(3.5e9)
usrp.set_rx_gain(60)

# Set up the streamer
st_args = UHD.StreamArgs("fc32", "sc16")
st_args.channels = [0]
streamer = get_rx_stream(usrp, st_args)

# Set up stream command
num_samps = 1000000  # streamer.get_max_num_samps()
stream_cmd = UHD.StreamCMD(UHD.StreamMode.num_done)
stream_cmd.stream_now = true
stream_cmd.num_samps = num_samps

# Issue stream command
issue_stream_cmd(streamer, stream_cmd)

# Receive the data from the USRP buffer
recv_buffer = zeros(ComplexF32, 1, num_samps)
metadata = UHD.RXMetadata()
samps = recv(streamer, recv_buffer, metadata)
println(samps)
println(metadata)
```

Note that in Julia, the indexing starts from 1, so I changed the `np.zeros((1, num_samps), dtype=np.complex64)` to `zeros(ComplexF32, 1, num_samps)`.

Also, make sure to install the `LibUHD.jl` package before running this code. You can install it using the Julia package manager:

```julia
import Pkg
Pkg.add("LibUHD")
```

# Additionally, ensure that you have the UHD driver and library installed on your system, as the Julia wrapper relies on it.
