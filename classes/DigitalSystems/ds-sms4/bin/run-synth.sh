PATH=${PATH}:/packages/LabSoC/ghdl/bin
PATH=${PATH}:/packages/LabSoC/Mentor/Models/bin
PATH=${PATH}:/packages/LabSoC/Xilinx/bin
ds_sms4=${HOME}/Developer/ds-sms4
sim=/tmp/${USER}/ds-sms4/ghdl
syn=/tmp/${USER}/ds-sms4/syn

rm -r $syn
mkdir -p $syn
cd $syn
vivado -mode batch -source ${ds_sms4}/vhdl/project/crypto.syn.tcl -notrace

cp /packages/LabSoC/ds-files/fsbl.elf .
cp /packages/LabSoC/ds-files/u-boot.elf .
bootgen -w -image ${ds_sms4}/vhdl/boot.bif -o boot.bin
cp ${ds_sms4}/bin/run-crypto.sh .


