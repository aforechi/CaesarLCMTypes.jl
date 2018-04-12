# taken from JuliaRobotics/BotCoreLCMTypes/test/runtests.jl

using CaesarLCMTypes
using LCMCore
using LCMCore: fingerprint
using Base.Test

#=
The following Python code was used to retrieve all of the
fingerprints for the various caesar lcmtypes automatically:
import sys
import inspect
import struct
import caesar
for name, obj in inspect.getmembers(caesar):
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
        apriltag_detections_t => -5989715576036496374,
        apriltag_t => -8216918138892019763,
        point_cloud_t => 2003008221351621598,
        pose_node_t => 249794548766818026,
        pose_pose_nh_t => 4072811593573625988,
        pose_pose_xyh_nh_t => -6037466938990705104,
        pose_pose_xyh_t => 9116064949984549703,
        prior_zpr_t => -3254265534732152215,
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
