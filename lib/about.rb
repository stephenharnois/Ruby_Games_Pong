class About
  def initialize game
    @game = game
    @screen = game.screen
    @queue = game.queue
                            
    @pong = Text.new 0, 35, "Pong", 100
    @line = GameObject.new(0, 125, Rubygame::Surface.new([@screen.width,10]).fill([255,255,255]))
    @created_by = Text.new 0, 150, "Created By: Tyler Church", 40
    @created_by2 = Text.new 0, 195, "And: Stephen Harnois", 40
    @for_the = Text.new 0, 240, "For the Making Games", 40
    @for_the2 = Text.new 0, 285, "With Ruby Tutorial", 40
    @on = Text.new 0, 330, "on Man With Code", 40
    @website = Text.new 0, 375, "http://manwithcode.com", 40
    [@created_by, @created_by2, @for_the, @for_the2, @on, @website, @pong, @line].each { |text| text.center_x @screen.width }
  end
      
  def update
    @queue.each do |ev|
      case ev
      when Rubygame::KeyDownEvent
        if ev.key == Rubygame::K_ESCAPE
          @game.switch_state Title.new(@game)
        end
      end
    end
  end

  def draw
    @screen.fill [0, 0, 0]

    [@pong, @line, @created_by, @created_by2, @for_the, @for_the2, @on, @website].each { |text| text.draw @screen }
                                  
    @screen.flip
  end
end
