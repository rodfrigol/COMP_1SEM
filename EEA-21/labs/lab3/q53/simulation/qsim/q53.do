onerror {quit -f}
vlib work
vlog -work work q53.vo
vlog -work work q53.vt
vsim -novopt -c -t 1ps -L cycloneive_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.q53_vlg_vec_tst
vcd file -direction q53.msim.vcd
vcd add -internal q53_vlg_vec_tst/*
vcd add -internal q53_vlg_vec_tst/i1/*
add wave /*
run -all
