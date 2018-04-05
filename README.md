# CaesarLCMTypes

A [Julia](http://www.julialang.org) package that is also compatible with pods.cmake build system for sharing [Caesar.jl](http://github.com/dehann/Caesar.jl) LCM types.
The Julia portion relies on [LCMCore.jl](http://github.com/rdeits/LCMCore.jl).

# Installation

This package may take some time before being registered on the Julia METADATA package ecosystem.  For now just use the direct clone:
```julia
Pkg.clone("https://github.com/JuliaRobotics/CaesarLCMTypes.jl.git")
```

# Basic usage example

```julia
using LCMCore, CaesarLCMTypes

function callback(channel, msg)
  @show msg.utime
end

lcm = LCM()

subscribe(lcm, "CHANNEL", callback, pose_pose_nh_t)

while (isgood(lcm)) end
```
