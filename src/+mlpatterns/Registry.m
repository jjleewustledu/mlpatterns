classdef (Sealed) Registry < mlpatterns.Singleton
   %SINGLETONIMPL Concrete Implementation of Singleton OOP Design Pattern
   %   Refer to the description in the abstract superclass Singleton for
   %   full detail.
   %   This class serves as a template for constructing your own custom
   %   classes.
   %
   %   Written by Bobby Nedelkovski
   %   The MathWorks Australia Pty Ltd
   %   Copyright 2009, The MathWorks, Inc.
   
   properties
      dipcommon  = '/opt/dip/common/';
      dipos
      docroot
      fslroot    = '/opt/fsl/';
      fsfasthome = '/opt/freesurfer/fsfast';
      homeroot   = [getenv('HOME') '/'];
      llpenv
      mexroot    = [getenv('HOME') '/Local/mex'];
      srcroot    = [getenv('HOME') '/Local/src'];
      randstream
   end
   
   properties (Constant)
       MLPACKAGES = { 'ASLtbx'     'dipcommands'  'mlanalysis' 'mlaveraging' 'mlbet' 'mlcaster' 'mlchoosers' ...
                      'mldb'       'mlentropy'    'mlfourd'    'mlfsl'       'mlio'  'mlkety' ...
                      'mlmri'      'mlniftitools' 'mlparallel' 'mlpatterns'  'mlpet' ...
                      'mlpipeline' 'mlpublish'    'mlrois'     'mlsurfer' };
       MLV_SERIAL = '7_9';
   end
   
   methods (Static)
      
      function obj = instance(qualifier)
          
         %% INSTANCE uses string qualifiers to implement registry behavior that
         %  requires access to the persistent uniqueInstance
         persistent uniqueInstance
         
         if (exist('qualifier','var') && ischar(qualifier))
             switch (qualifier)
                 case 'initialize'
                     uniqueInstance = [];
                 case 'clear'
                     clear uniqueInstance;
                     return;
                 case 'delete'
                     if (~isempty(uniqueInstance))
                         uniqueInstance.delete;
                         return;
                     end
             end
         end
         
         if (isempty(uniqueInstance))
            obj = mlpatterns.Registry();
            uniqueInstance = obj;
         else
            obj = uniqueInstance;
         end
      end
      
      %% FAVOR using static public methods
      
      function       startup()
          mlpatterns.Registry.setSrcPath();
          mlpatterns.Registry.setTestPath();
          mlpatterns.Registry.setMexPath();
          mlpatterns.Registry.setFslPath();
          mlpatterns.Registry.setFreeSurfer();
          mlpatterns.Registry.setDip();
      end
      
      function       setFreeSurfer()
          obj = mlpatterns.Registry.instance();
          fsfasttoolbox = sprintf('%s/toolbox',obj.fsfasthome);
          if (~isempty(strfind(path, fsfasttoolbox)))
              path(fsfasttoolbox, path);
          end
      end
      
      function       setDip()
          obj = mlpatterns.Registry.instance();
          %if (isempty(strfind(path, obj.dipcommon)))
              path([...
                fullfile(obj.dipcommon, 'dipimage') pathsep ...
                fullfile(obj.dipcommon, 'dipimage/demos') pathsep ...
                fullfile(obj.dipcommon, 'dipimage/aliases') pathsep ...
                fullfile(obj.dipos,     'include') pathsep ...
                fullfile(obj.docroot,   'diplib')], path);
              
              dipllp = [...
	              fullfile(obj.dipcommon,['mlv' obj.MLV_SERIAL '/dipimage_mex']) pathsep ...
	              fullfile(obj.dipcommon,['mlv' obj.MLV_SERIAL '/diplib']) pathsep ... 
	              fullfile(obj.dipcommon,['mlv' obj.MLV_SERIAL '/diplib_dbg']) pathsep ... 
	              fullfile(obj.dipos,     'lib')];
			  setenv(obj.llpenv, [dipllp pathsep getenv(obj.llpenv)]);
          %end
          try
              dip_initialise
              dipsetpref('CommandFilePath',[obj.srcroot, 'mlcvl/dipcommands']);
              dipsetpref('imagefilepath',   pwd);
          catch ME 
              [s, s1] = system(['echo $' obj.llpenv]);
              disp(['startup:  dip_initialise failed; check validity of ' obj.llpenv]);
			  disp(['          status -> ' num2str(s)]);
			  disp(['         ' obj.llpenv ' -> '  s1]);
              handwarning(ME);
          end
      end
      
      function       setFslPath()
          obj = mlpatterns.Registry.instance();
          path( ...
              fullfile(obj.srcroot,  'mlcvl/mlniftitools/global'), path);
          if (isempty(strfind(path, obj.fslroot(1:end-1))))
              path(...
                  fullfile(obj.fslroot,  'etc/matlab'), path);
          end
      end
      
      function       setMexPath()
          obj = mlpatterns.Registry.instance();
          if (isempty(strfind(path, obj.mexroot(1:end-1))))
              path(obj.mexroot, path);
          end
      end
      
      function       setTestPath()
          obj = mlpatterns.Registry.instance();
          if (isempty(strfind(path, 'matlab_xunit/tests')))
              assert(~verLessThan('matlab', '7.11.0'));
                  path(fullfile(obj.srcroot, 'mlcvl/matlab_xunit/tests'), path);
                  path(fullfile(obj.srcroot, 'mlcvl/mlniftitools/test'), path);
              for p = 1:length(obj.MLPACKAGES) %#ok<*FORFLG>
                  path(fullfile(obj.srcroot, 'mlcvl', obj.MLPACKAGES{p}, 'test'), path);
              end
          end
      end
      
      function       setSrcPath()
          obj = mlpatterns.Registry.instance();
          if (isempty(strfind(path, 'mfiles')))
              assert(~verLessThan('matlab', '7.11.0'));
              path([...
                  fullfile(obj.srcroot, 'mlcvl/dicom_sort_convert/src') pathsep ...
                  fullfile(obj.srcroot, 'mlcvl/dicom_spectrum/src') pathsep ...
                  fullfile(obj.srcroot, 'mlcvl/export_fig') pathsep ...
                  fullfile(obj.srcroot, 'mlcvl/explorestruct') pathsep ...
                  fullfile(obj.srcroot, 'mlcvl/lutbar') pathsep ...
                  fullfile(obj.srcroot, 'mlcvl/matlab_xunit/xunit') pathsep ...
                  fullfile(obj.srcroot, 'mlcvl/mfiles') pathsep ...
                  fullfile(obj.srcroot, 'mlcvl/mlniftitools/src/') pathsep ...
                  fullfile(obj.srcroot, 'mlcvl/StructBrowser') pathsep ...
                  fullfile(obj.srcroot, 'mlcvl/xml_io_tools') ...
                  ], path);
              for p = 1:length(obj.MLPACKAGES) %#ok<*FORFLG>
                  path(fullfile(obj.srcroot, 'mlcvl', obj.MLPACKAGES{p}, 'src'), path);
              end
          end
          
          
      end      
   end % static methods
   
   methods
       function clear(this)
            this.delete;
            clear(this);
        end
   end 
        
   methods (Access=private)
      
       function newObj = Registry()
           if (exist(          '/Library/Documentation/Applications/','dir'))
               newObj.docroot = '/Library/Documentation/Applications/';
           elseif (exist(       [getenv('HOME') '/Library/Documentation/Applications/'],'dir'))
               newObj.docroot = [getenv('HOME') '/Library/Documentation/Applications/'];
           end
           switch (computer('arch'))
               case 'maci64'
			newObj.llpenv       = 'DYLD_LIBRARY_PATH';
                   newObj.dipos = '/opt/dip/Darwin/';
               case {'glnxa64' 'glnx86'}
			newObj.llpenv       =   'LD_LIBRARY_PATH';
				   newObj.dipos = '/opt/dip/Linux/';
               otherwise
                   error('mlpatterns:NotImplemented', 'Registry.ctor.computer() -> %s\n', computer('arch'));
           end
           newObj.mexroot    = [newObj.homeroot 'Local/mex/'];
           newObj.srcroot    = [newObj.homeroot 'Local/src/'];
           newObj.randstream = RandStream('mt19937ar','seed',sum(100*clock));
                               RandStream.setGlobalStream(newObj.randstream);
      end
   end
end
