# frozen_string_literal: true

require 'rmagick'

class MainBackground
  def self.generate
    Magick::Draw.new do |draw|
      draw.fill = SocialImage::WHITE
    end
  end
end

class TitleText
  POINTSIZE = 60

  def self.generate
    Magick::Draw.new do |draw|
      draw.fill = SocialImage::BLACK
      draw.font = SocialImage::PROMPT_PATH
      draw.gravity = Magick::CenterGravity
      draw.pointsize = POINTSIZE
    end
  end
end

class Separator
  def self.generate
    Magick::Draw.new do |draw|
      draw.stroke = SocialImage::LIGHT_GRAY
      draw.stroke_width = 30
    end
  end
end

class MetaText
  POINTSIZE = 32

  def self.generate
    Magick::Draw.new do |draw|
      draw.fill = SocialImage::BLACK
      draw.font = SocialImage::OPEN_SANS_PATH
      draw.gravity = Magick::WestGravity
      draw.pointsize = POINTSIZE
    end
  end
end

class SocialImage
  WIDTH = 1024
  HEIGHT = 512

  BLACK = '#0A2411'
  LIGHT_GRAY = '#E0E3E1'
  LIGHT_GREEN = '#E4FFED'
  WHITE = '#FFFFFF'

  OPEN_SANS_PATH = '/Users/jon/Library/Fonts/OpenSans-Regular.ttf'
  PROMPT_PATH = '/Users/jon/Library/Fonts/Prompt-Bold.ttf'

  def self.generate(options)
    new(options).generate
  end

  attr_reader :options, :social_image

  def initialize(options)
    @options = options
  end

  def generate
    create_image
    populate_image
    write_image
  end

  private

  def two_line_title?
    options[:title_parts].size == 2
  end

  def create_image
    image_height = two_line_title? ? HEIGHT : HEIGHT - 80
    @social_image = Magick::Image.new(WIDTH, image_height) do |image|
      image.background_color = LIGHT_GREEN
      image.format = 'png'
    end
  end

  def populate_image
    draw_main_background
    draw_title_lines
    draw_separator
    draw_meta
    draw_logo
  end

  def draw_main_background
    main_background = MainBackground.generate
    height = two_line_title? ? HEIGHT - 50 : HEIGHT - 130
    main_background.rectangle(50, 50, WIDTH - 50, height)
    main_background.draw(social_image)
  end

  def draw_title_lines
    title_lines = options[:title_parts]
    pointsize = TitleText::POINTSIZE

    title_lines.each_with_index do |line, i|
      y_offset = (pointsize * i * 1.2) + 90
      TitleText.generate.annotate(social_image, (WIDTH - 160), pointsize, 80, y_offset, line)
    end
  end

  def draw_separator
    top_line = Separator.generate
    y_offset = two_line_title? ? 270 : 200
    top_line.line(80, y_offset, WIDTH - 80, y_offset)
    top_line.draw(social_image)
  end

  def compute_meta
    published = "published #{options[:published_at].strftime('%m/%d/%y')}"
    words = "#{options[:word_count]} words"
    read_time = "#{options[:reading_time]} minute read"
    [published, words, read_time].join(', ')

    metaline = [published, words, read_time].join(', ')
    tagline = 'forty hours a week is plenty, fortyeven.com'

    [metaline, tagline]
  end

  def draw_meta
    meta_lines = compute_meta
    pointsize = MetaText::POINTSIZE
    y_offset = two_line_title? ? 340 : 250

    meta_lines.each_with_index do |line, i|
      offset = (pointsize * i * 1.6) + y_offset
      MetaText.generate.annotate(social_image, (WIDTH - 160), pointsize, 80, offset, line)
    end
  end

  def draw_logo
    logo_size = 100
    append_image = Magick::Image.read('source/images/favicon.png').first.resize_to_fit(logo_size)
    y_offset = two_line_title? ? (HEIGHT - logo_size - 80) : 250
    social_image.composite!(append_image, (WIDTH - logo_size - 80), y_offset, Magick::OverCompositeOp)
  end

  def write_image
    path = options[:output_path]
    FileUtils.mkdir_p(File.dirname(path))
    social_image.write(path)
  end
end
