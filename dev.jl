using Pkg; Pkg.activate(".")
using Revise
using Toolips
using SampleApp
toolips_process = start!(SampleApp, ip = "192.168.1.15":8000, threads = 2)
