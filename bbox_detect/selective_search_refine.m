function boxes = selective_search_refine(im, bbox)
  th = tic();
  fast_mode = true;
  % im_width = 500;
  im_width = [];
  boxes = [];
  bbox2 = bbox; 
  bbox = bbox_expand(im, bbox);

  h = figure;
  for idx = 1 : size(bbox, 1)
    % im_tmp2 = double(imcrop(im, bbox2(idx, :)));
    % imshow(im_tmp2);
    imshow(im);
    rectangle('Position', bbox2(idx, :), 'EdgeColor', 'r');
    pause;
    
    im_tmp = double(imcrop(im, bbox(idx, :)));
    rectangle('Position', bbox(idx, :), 'EdgeColor', 'y');
    pause;
    
    box_tmp = selective_search_boxes(im_tmp, fast_mode, im_width);
    box_tmp = box_tmp(:, [2 1 4 3]);
    boxes = [boxes; box_tmp];
  end
  close(h);
  fprintf('found %d candidates (in %.3fs).\n', size(boxes,1), toc(th));
end
