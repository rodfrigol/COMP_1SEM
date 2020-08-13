onerror {quit -f}
vlib work
vlog -work work q61.vo
vlog -work work q61.vt
vsim -novopt -c -t 1ps -L cycloneive_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.q61_vlg_vec_tst
vcd file -direction q61.msim.vcd
vcd add -internal q61_vlg_vec_tst/*
vcd add -internal q61_vlg_vec_tst/i1/*
add wave /*
run -all
