n_gpu=${1}
python3 launch.py --nn 1 --eval-only --np ${n_gpu} \
--uni 1 --config-file projects/UNINEXT/configs/image_joint_r50.yaml \
--resume OUTPUT_DIR outputs/test_${n_gpu}gpu
