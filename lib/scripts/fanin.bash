#!/usr/bin/env bash

DOZIP=true

JOBBASE=$1
method_name=${2}
START_N=${3}
END_N=${4}

source ${JOBBASE}/ENV_DUMP.txt
source ${JOBBASE}/SETTINGS_2.bash

echo "USING PYTHON " $(which python)


export > ${JOBBASE}/final.bash

#assume BASE exists

method_sample_dir=${JOBBASE}/samples/method_${method_name}/
zip_archive_dir=${method_sample_dir}/zips/
mkdir -p ${zip_archive_dir}


#this can be changed later if we decide we want to stage the data in
datadir_to_use=${JOBBASE}/data

PYTHONPATH=${PYTHONPATH}:${BASE}/lib/GEMSTAT_scripts/python/src/:${BASE}/lib/notebook_core/:${BASE}/lib/sampling_core/:


#Run the fanin script
PYTHONPATH=${PYTHONPATH} python ${BASE}/lib/python/sampling_core/fanin.py ${JOBBASE}/crossval/${method_name}.hd5 ${method_sample_dir} $(seq ${START_N} ${END_N})


#zip up all the files that were used.
if [ "$DOZIP" == "true" ]
then
	for i in $( seq ${START_N} ${END_N} )
	do

		zip -q -g ${zip_archive_dir}/batch_${START_N}_${END_N}.zip -m ${method_sample_dir}/out/${i}.out -m ${method_sample_dir}/out/${i}.par -m ${method_sample_dir}/log/${i}.log -m ${method_sample_dir}/log/*_${i}.log -m ${method_sample_dir}/crossval/*_${i}.out

		zip -q -g ${JOBBASE}/log/batch_${method_name}_refine_${START_N}_${END_N}.zip -m ${JOBBASE}/log/refine_${method_name}.error.${i} -m ${JOBBASE}/log/refine_${method_name}.out.${i}

	done
fi
