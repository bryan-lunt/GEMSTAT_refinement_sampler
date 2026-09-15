### ENVIRONMENT SETUP
source /etc/profile.d/modules.sh
module load python/2.7.11
###

DEBUG=False
DO_FANIN=True
DEBUG_FANING=True

N_TO_REFINE=10
BATCH_SIZE=10



DATA_ORIGIN="example"
TRAIN_ORTHO="mel"
CROSSVAL_ORTHOS="mel sim sec yak ere ana"
TEMPLATE_NAME="template.par"
#subtrain
#training


method_names="EXAMPLE"
#Other environment variables provided to the method script
method_environment_EXAMPLE="NA_CYCLES=1 COPIES=0 SIGMA0=0.02 SIGMA1=0.00"
#Other command-line parameters provided to the method script after a --
method_args_EXAMPLE="-o Direct -oo SSE -ct 50 -rt 0 -oq -no_gt_out"
