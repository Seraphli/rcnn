function rcnn_model = load_rcnn_model(model_choice, use_gpu)
  fprintf('Initializing R-CNN model (this might take a little while)\n');
  switch model_choice
    case 'PASCAL'
      % Example using the PASCAL VOC 2007 fine-tuned detectors (20 classes)
      rcnn_model_file = './data/rcnn_models/voc_2012/rcnn_model_finetuned.mat';
    case 'ILSVRC13'
      % Example using the ILSVRC13 fine-tuned detectors (200 classes)
      rcnn_model_file = './data/rcnn_models/ilsvrc2013/rcnn_model.mat';
  end
  rcnn_model = rcnn_load_model(rcnn_model_file, use_gpu);
  fprintf('done\n');
end
