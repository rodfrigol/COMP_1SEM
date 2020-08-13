onerror {quit -f}
vlib work
vlog -work work q5.vo
vlog -work work q5.vt
vsim -novopt -c -t 1ps -L cycloneive_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.q5_vlg_vec_tst
vcd file -direction q5.msim.vcd
vcd add -internal q5_vlg_vec_tst/*
vcd add -internal q5_vlg_vec_tst/i1/*
add wave /*
run -all
