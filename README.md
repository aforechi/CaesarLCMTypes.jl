# CaesarLCMTypes

[![Build Status](https://travis-ci.org/JuliaRobotics/CaesarLCMTypes.jl.svg?branch=master)](https://travis-ci.org/JuliaRobotics/CaesarLCMTypes.jl)
[![codecov.io](https://codecov.io/github/JuliaRobotics/CaesarLCMTypes.jl/coverage.svg?branch=master)](https://codecov.io/github/JuliaRobotics/CaesarLCMTypes.jl?branch=master)

This package implements the [LCM](http://lcm-proj.github.io/) type definitions from [openhumanoids/bot_core_lcmtypes](https://github.com/openhumanoids/bot_core_lcmtypes) in Julia using [LCMCore.jl](https://github.com/JuliaRobotics/LCMCore.jl). Each lcmtype has a matching native Julia type with associated `encode()` and `decode()` methods.

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
  # ...
  nothing
end

lcm = LCM()

subscribe(lcm, "CHANNEL", callback, pose_pose_nh_t)

while true
  handle(lcm)
end
```
