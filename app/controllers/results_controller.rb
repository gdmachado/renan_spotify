class ResultsController < ApplicationController
	def regexify
		@input = params[:q].split(/\r?\n/)
		@string = ""
		for line in @input
			begin
				@regex = /^\s*[1-9]*\.\s*([\s\S\d\D\w\W]*)\s+-\s*([\s\S\d\D\w\W]*)$/.match(line)
				@string << @regex[2].strip + ' - ' + @regex[1].strip + "\n"
			rescue	
				@string << "ERRO: Fora do padrao ("+line+")\n"
			end
		end
	end
end
