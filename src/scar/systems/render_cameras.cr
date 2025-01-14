class Scar::Systems::RenderCameras < Scar::System
  def render(app, space, dt)
    space.each_with(Scar::Components::Camera) do |ent, cam|
      tr = ent[Scar::Components::Transform]
      z = ent[Components::Z]

      view = SF::View.new
      view.reset(SF.float_rect(tr.pos.x, tr.pos.y, cam.width, cam.height))

      space.each_with_transform(Scar::Components::Drawable) do |drawable_ent, drawable_tr, drawable|
        sf = drawable.sf

        app.window.draw(sf) if sf.is_a? SF::Drawable
      end
    end
  end
end
