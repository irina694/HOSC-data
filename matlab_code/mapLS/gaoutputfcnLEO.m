function [state, options,optchanged] = gaoutputfcnLEO(options,state,flag,p1,p2)
global Gvars savestate individuals
%GAOUTPUTFCNTEMPLATE Template to write custom OutputFcn for GA.
%   [STATE, OPTIONS, OPTCHANGED] = GAOUTPUTFCNTEMPLATE(OPTIONS,STATE,FLAG,...
%   INTERVAL) where OPTIONS is an options structure used by GA.
%
%   STATE: A structure containing the following information about the state 
%   of the optimization:
%             Population: Population in the current generation
%                  Score: Scores of the current population
%             Generation: Current generation number
%              StartTime: Time when GA started 
%               StopFlag: String containing the reason for stopping
%              Selection: Indices of individuals selected for elite,
%                         crossover and mutation
%            Expectation: Expectation for selection of individuals
%                   Best: Vector containing the best score in each generation
%        LastImprovement: Generation at which the last improvement in
%                         fitness value occurred
%    LastImprovementTime: Time at which last improvement occurred
%
%   FLAG: Current state in which OutPutFcn is called. Possible values are:
%         init: initialization state 
%         iter: iteration state
%         done: final state
% 		
%   P1,P2: Additional arguments as needed for OutputFcn.
%
%   STATE: Structure containing information about the state of the
%          optimization.
%   OPTCHANGED: Boolean indicating if the options have changed.
%
%	See also PATTERNSEARCH, GA, GAOPTIMSET

%   Copyright 2004 The MathWorks, Inc.
%   $Revision: 1.1.6.2 $  $Date: 2004/03/09 16:15:36 $


optchanged = false;

switch flag
 case 'init'
        if(~isempty(savestate)) %it restarting a problem
            aux = savestate{end};
            clear savestate
            savestate{1} = aux;
        else
            aux = state;
            savestate{state.Generation+1}=aux;
            save(Gvars.save2File,'savestate');
            save([Gvars.save2File,'_ind'],'individuals');
        end
        disp('Starting the algorithm');
        %      0123456789012345678901234567890123456789
        disp('Generation  LastImprovement  Best       ');
        fprintf(1,'%7i %11i %22.6e \n',[state.Generation, state.LastImprovement, min(state.Score)]);
    case 'iter'
        fprintf(1,'%7i %11i %22.6e \n',[state.Generation, state.LastImprovement, min(state.Score)]);
        aux = state;
        savestate{state.Generation+1}=aux;
        save(Gvars.save2File,'savestate');
        save([Gvars.save2File,'_ind'],'individuals');
    case 'done'
        disp('Performing final task');
    otherwise
        disp('Nothing to do');
end
