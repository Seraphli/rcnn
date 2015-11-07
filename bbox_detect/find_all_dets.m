function all_dets = find_all_dets(im, boxes, rcnn_model)
  thresh = -1;
  % extract features from candidates (one row per candidate box)
  feat = rcnn_features(im, boxes, rcnn_model);
  feat = rcnn_scale_features(feat, rcnn_model.training_opts.feat_norm_mean);

  % compute scores for each candidate [num_boxes x num_classes]
  scores = bsxfun(@plus, feat*rcnn_model.detectors.W, rcnn_model.detectors.B);

  % apply NMS to each class and return final scored detections
  num_classes = length(rcnn_model.classes);
  dets = cell(num_classes, 1);
  for i = 1:num_classes
    I = find(scores(:, i) > thresh);
    scored_boxes = cat(2, boxes(I, :), scores(I, i));
    keep = nms(scored_boxes, 0.3);
    dets{i} = scored_boxes(keep, :);
  end

  all_dets = [];
  for i = 1:length(dets)
    all_dets = cat(1, all_dets, ...
        [i * ones(size(dets{i}, 1), 1) dets{i}]);
  end

  [~, ord] = sort(all_dets(:,end), 'descend');
  all_dets = all_dets(all_dets(:, end) > 0, :);
end
