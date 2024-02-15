n_gpu=${1}
python3 launch.py --nn 1 --eval-only --np ${n_gpu} \
--uni 1 --config-file projects/UNINEXT/configs/image_joint_vit_huge_32g.yaml \
--resume OUTPUT_DIR outputs/test_vit_${n_gpu}gpu_intergroup
