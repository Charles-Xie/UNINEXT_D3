# Evaluate UNINEXT on D3

For UNINEXT itself, refer to [UNINEXT official repo](https://github.com/MasterBin-IIAU/UNINEXT). 

## checkpoints

```bash
Download the checkpoints from UNINEXT official repo, to $YOUR_PATH:

├── R-50.pkl
├── stage2_official
│   └── model_final.pth
├── stage2_vit_official
│   └── model_final.pth
└── stage3_vit_official
    └── model_final.pth
```

Please run this:
```bash
ln -s ${YOUR_PATH}/ ./
ln -s ${YOUR_PATH}/stage2_official ./outputs/
ln -s ${YOUR_PATH}/stage2_vit_official ./outputs/
ln -s ${YOUR_PATH}/stage3_vit_official ./outputs/
```


## conda enviroment

```bash
pip3 install -e . --user
pip3 install --user shapely==1.7.1
# an edited cocoapi package
cd cocoapi/PythonAPI/
pip install -e .
cd ..
# an edited cocoapi package
# git clone https://github.com/XD7479/cocoapi.git
# cd cocoapi/PythonAPI/
# pip install -e .
# cd ..
# an edited cocoapi package
pip install lvis
pip3 install --user jpeg4py visdom easydict scikit-image
pip3 install --user transformers tikzplotlib motmetrics

<!-- you may need to srun a GPU first -->
cd projects/UNINEXT/uninext/models/deformable_detr/ops
bash make.sh
```


## Evaluation code

For the proposed dataset, run this:
```bash
bash run_d3_multigpu.sh 8  # 8 is the number of GPU you want to use and can be smaller
bash run_d3_vit_multigpu.sh 8  # for the largest vit backbone
```

The result saved is the COCO standard format:

```json
{
    'category_id': int,
    'score': float,
    'bbox': [float, float, float, float],  # xywh
    'image_id': int,
}
```

Please refer to [D3 official documentation](https://github.com/shikras/d-cube/blob/main/doc.md) for more details.
