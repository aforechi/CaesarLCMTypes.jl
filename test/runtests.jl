# taken from JuliaRobotics/BotCoreLCMTypes/test/runtests.jl

using CaesarLCMTypes
using LCMCore
using LCMCore: fingerprint
using Base.Test

#=
The following Python code was used to retrieve all of the
fingerprints for the various bot_core lcmtypes automatically:
import sys
import inspect
import struct
import bot_core
for name, obj in inspect.getmembers(bot_core):
    if inspect.isclass(obj):
        print("{:s} => {:d},".format(name, struct.unpack('q', obj._get_packed_fingerprint())[0]))
import sys
import inspect
import struct
import drake
for name, obj in inspect.getmembers(drake):
    if inspect.isclass(obj):
        print("{:s} => {:d},".format(name, struct.unpack('q', obj._get_packed_fingerprint())[0]))
=#


"""
Equality test for most types, but we compare LCMType instances
by looking at their fields, since otherwise == just falls back
to === which compares object identity and is thus not very
informative.
"""
closeenough(x, y) = x == y
function closeenough(x::LCMType, y::LCMType)
    (typeof(x) == typeof(y)) || return false
    for name in fieldnames(x)
        closeenough(getfield(x, name), getfield(y, name)) || return false
    end
    true
end


@testset "BotCoreLCMTypes" begin
    expected_fingerprints_network_order = Dict(
        # atlas_command_t => 1312111223708868662,
        point_cloud_t => 0,
        pose_node_t => 0,
        pose_pose_nh_t => 0,
        pose_pose_xyh_nh_t => 0,
        pose_pose_xyh_t => 0,
        prior_zpr_t => 0
    )

    for (lcmtype, fingerprint_network_order) in expected_fingerprints_network_order
        @testset "$lcmtype" begin
            @testset "constructor" begin
                msg = lcmtype()
                for name in fieldnames(typeof(msg))
                    @test closeenough(getfield(msg, name), LCMCore.defaultval(typeof(getfield(msg, name))))
                end
            end
            @testset "fingerprint" begin
                @test hton(fingerprint(lcmtype)) == fingerprint_network_order
            end
        end
    end
end
