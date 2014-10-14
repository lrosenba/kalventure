class MenuController < ApplicationController
  def start
      motion_capture = Motion::Capture.new
      motion_capture = Motion::Capture.new(device: :front) # specify camera

      preview = motion_capture.capture_preview_view(frame: view.bounds)
      view.addSubview(preview) # UIView containing AVCaptureVideoPreviewLayer

      motion_capture.toggle_camera # Switch between front/rear cameras
      motion_capture.toggle_flash  # Switch bettwen flash on/off

      motion_capture.turn_flash_on
      motion_capture.turn_flash_off
  end
end
