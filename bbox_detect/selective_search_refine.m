function boxes = selective_search_refine(im, bbox)
  th = tic();
  fast_mode = true;
  % im_width = 500;
  im_width = [];
  boxes = [];
  bbox = bbox_expand(im, bbox);
  h = figure;
  for idx = 1 : size(bbox, 1)
    im_tmp = imcrop(im, bbox(idx, :));
    
    box_tmp = selective_search_boxes(im_tmp, fast_mode, im_width);
    % compat: change coordinate order from [y1 x1 y2 x2] to [x1 y1 x2 y2]
    box_tmp = box_tmp(:, [2 1 4 3]);
    box_tmp(:, 1) = box_tmp(:, 1) + repmat(bbox(idx, 1), size(bbox, 1), 1);
    box_tmp(:, 3) = box_tmp(:, 3) + repmat(bbox(idx, 1), size(bbox, 1), 1);
    box_tmp(:, 2) = box_tmp(:, 2) + repmat(bbox(idx, 2), size(bbox, 1), 1);
    box_tmp(:, 4) = box_tmp(:, 4) + repmat(bbox(idx, 2), size(bbox, 1), 1);
    % imshow(im);
    % brect = bbox_pos2rect(box_tmp);
    % for i = 1 : size(brect, 1)
    %   rectangle('Position', brect(i, :), 'EdgeColor', 'r');
    % end
    % pause(0.1);
    boxes = [boxes; box_tmp];
  end
  close(h);
  fprintf('found %d candidates (in %.3fs).\n', size(boxes,1), toc(th));
end
