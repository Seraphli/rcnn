function boxes = selective_search_refine(im, bbox)
  th = tic();
  fast_mode = true;
  % im_width = 500;
  im_width = [];
  for idx = 1 : length(bbox)
    im_tmp = imcrop(im, bbox(i));
    box_tmp = selective_search_boxes(im_tmp, fast_mode, im_width);
    box_tmp = box_tmp(:, [2 1 4 3]);
    boxes = [boxes; box_tmp];
  end
  fprintf('found %d candidates (in %.3fs).\n', size(boxes,1), toc(th));
end
