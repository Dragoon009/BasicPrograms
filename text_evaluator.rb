class TextEvaluator

  AVAILABLE_STAGES = %w[ManualReview PhoneInterview BackgroundCheck DocumentSigning]

  def initialize(text)
    @text = text
  end

  def parse_input
    @commands = @text.split("\n")
    @stages = []
    @email = []
    @output = ""
    @applicants = { }
    @hired = 0
    @rejected = 0
    @error = nil
    

    set_stages
    return "Empty input" if @stages.length == 0
    @commands.each do |command|
      command = command.split(" ")
      case command[0]
      when "CREATE"
        find_or_create_applicant(command[1])               
      when "ADVANCE"
        advance_applicant(command[1], command[2])
      when "DECIDE"
        decide_applicant(command[1], command[2])
      when "STATS"
        display_stats
      else
        return_error
      end
      return @output if @error
    end
    @output
  end

  def return_error
    @output = "Wrong input"
    @error = true
  end

  def set_stages
    if !@commands[0]&.start_with? "DEFINE"
      return_error
    else
      stages = @commands[0].split(" ")
      stages.shift
      stages.each do |stage|
        @stages << stage if AVAILABLE_STAGES.include? stage 
      end
      @output += "DEFINE #{@stages.join(' ')}"
    end
    @commands.shift
  end

  def find_or_create_applicant(email)
    @email << email
    if @email.count(email) > 1
      @output += "\nDuplicate applicant"
      @email = @email.uniq
    else
      @applicants[email] = 0
      @output += "\nCREATE #{email}"
    end
  end

  def advance_applicant(email, stage = nil)
    return return_error unless @email.include?(email)
    return return_error if !stage.nil? && !@stages.include?(stage) 
    if stage
      index = @stages.index(stage) 
      if @applicants[email] == index
        @output += "\nAlready in #{stage}"
      else
        @applicants[email] = index
        @output += "\nADVANCE #{email}"
      end
    else
      if @applicants[email] >= @stages.count - 1 
        @output += "\nAlready in #{@applicants[email]&.last}"
      else
        @applicants[email] += 1
        @output += "\nADVANCE #{email}"
      end
    end

  end

  def decide_applicant(email, decision)
    return return_error unless @email.include?(email)
    if decision == "0" 
      @rejected += 1
      @applicants[email] = 0  
      @output += "\nRejected #{email}"
    elsif decision == "1" && @applicants[email] >= @stages.count - 1
      @hired += 1
      @applicants[email] = 0 
      @output += "\nHired #{email}"
    else
      @output += "\nFailed to decide for #{email}"
    end
  end

  def display_stats
    stats = "\n"
    @stages.each do |stage|
      amount = @applicants.values.flatten.count(@stages.index(stage))
      stats += "#{stage} #{amount} "
    end
    stats += "Hired #{@hired} Rejected #{@rejected}"
    @output += stats
  end

end