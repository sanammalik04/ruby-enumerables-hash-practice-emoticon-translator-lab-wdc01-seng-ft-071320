require 'yaml'

def load_library(path)
  emoticons = {}
  YAML.load_file(path).each do |meaning, describe|
    eng, jan = describe
    emoticons[meaning] = {:english => "", :japanese => ""}
    emoticons[meaning][:english] = eng
    emoticons[meaning][:japanese] = jan
  end
  return emoticons
end

def get_japanese_emoticon(path, emoticon)
  emoticons = load_library(path)
  result = emoticons.select{|key, hash| hash[:english] == emoticon }
  emotion = result.keys[0]
  if result.length > 0
    return result[emotion][:japanese]
  else
    return "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(path, emoticon)
  emoticons = load_library(path)
  result = emoticons.select{|key, hash| hash[:japanese] == emoticon }
  if result.length > 0
    return result.keys[0]
  else
    return "Sorry, that emoticon was not found"
  end
end

