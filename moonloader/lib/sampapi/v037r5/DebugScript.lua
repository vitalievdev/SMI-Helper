--[[
    Project: SAMP-API.lua <https://github.com/imring/SAMP-API.lua>
    Developers: imring, LUCHARE, FYP

    Special thanks:
        SAMemory (https://www.blast.hk/threads/20472/) for implementing the basic functions.
        SAMP-API (https://github.com/BlastHackNet/SAMP-API) for the structures and addresses.
]]

local sampapi = require 'sampapi'
local shared = sampapi.shared
local mt = require 'sampapi.metatype'
local ffi = require 'ffi'

shared.require 'CVector'

shared.ffi.cdef[[
typedef struct SCObjectPool SCObjectPool;
struct SCObjectPool;

enum {
    LINE_BUFFER_LENGTH = 256,
};
]]

local function RefPrivateObjectPool() return ffi.cast('SCObjectPool**', sampapi.GetAddress(0x14FFAC))[0] end
local function RefObjectCount() return ffi.cast('unsigned short*', sampapi.GetAddress(0x14FFB0))[0] end
local function RefNewCameraPos() return ffi.cast('SCVector*', sampapi.GetAddress(0x14FFA0))[0] end
local Initialize = ffi.cast('void(__cdecl*)(const char*)', sampapi.GetAddress(0x9E9B0))
local ProcessLine = ffi.cast('void(__cdecl*)(const char*)', sampapi.GetAddress(0x9E8A0))
local GetCommandParams = ffi.cast('char*(__cdecl*)(char*)', sampapi.GetAddress(0x9E4B0))
local CreateVehicle = ffi.cast('void(__cdecl*)(const char*)', sampapi.GetAddress(0x9E610))
local CreateObject = ffi.cast('void(__cdecl*)(const char*)', sampapi.GetAddress(0x9E500))

return {
    RefPrivateObjectPool = RefPrivateObjectPool,
    RefObjectCount = RefObjectCount,
    RefNewCameraPos = RefNewCameraPos,
    Initialize = Initialize,
    ProcessLine = ProcessLine,
    GetCommandParams = GetCommandParams,
    CreateVehicle = CreateVehicle,
    CreateObject = CreateObject,
}