classdef Test_CellComposite < matlab.unittest.TestCase
	%% TEST_CELLCOMPOSITE 

	%  Usage:  >> results = run(mlpatterns_unittest.Test_CellComposite)
 	%          >> result  = run(mlpatterns_unittest.Test_CellComposite, 'test_dt')
 	%  See also:  file:///Applications/Developer/MATLAB_R2014b.app/help/matlab/matlab-unit-test-framework.html

	%  $Revision$
 	%  was created 14-Jan-2016 23:46:59
 	%  by jjlee,
 	%  last modified $LastChangedDate$
 	%  and checked into repository /Users/jjlee/Local/src/mlcvl/mlpatterns/test/+mlpatterns_unittest.
 	%% It was developed on Matlab 9.0.0.307022 (R2016a) Prerelease for MACI64.
 	

	properties
        testca = {'a' 'b' {'c' 'd' {'e' 'f' [1 2 3]    struct('afield', 'a value')}}}
        testCA = {'A' 'B' {'C' 'D' {'E' 'F' [11 22 33] struct('AFIELD', 'A VALUE')}}}
 		testObj
 	end

	methods (Test)
		function test_cell(this)
            this.verifyEqual(this.testCA{1}, 'A');
            this.verifyEqual(this.testCA(1), {'A'});
            tmp = this.testCA{:};
            this.verifyEqual(tmp, 'A');
            tmp = this.testCA(:);
            this.verifyEqual(tmp, this.testCA.')
            this.verifyEqual(this.testCA{3}{3}{3}, [11 22 33]);
            this.verifyEqual(this.testCA{3}{3}{3}(3), 33);
            this.verifyEqual(this.testCA{3}{3}{4}.AFIELD, 'A VALUE');
 		end
		function test_cellComposite(this)
            this.verifyEqual(this.testObj{1}, 'A');
            this.verifyEqual(this.testObj(1), {'A'});
            tmp = this.testObj{:};
            this.verifyEqual(tmp, 'A');
            tmp = this.testObj(:);
            this.verifyEqual(tmp, this.testObj.')
            this.verifyEqual(this.testObj{3}{3}{3}, [11 22 33]);
            this.verifyEqual(this.testObj{3}{3}{3}(3), 33);
            this.verifyEqual(this.testObj{3}{3}{4}.AFIELD, 'A VALUE');
        end
        function test_cat(this)
            import mlpatterns.*;
            this.verifyEqual( [this.testObj  this.testObj], ...
                CellComposite([this.testCA   this.testCA]));
            this.verifyEqual( [this.testObj; this.testObj], ...
                CellComposite([this.testCA;  this.testCA]));
        end
        function test_dotProperty(this)
            this.verifyEqual(this.testObj.testProperty, this.testca);
            this.verifyEqual(this.testObj.testProperty{3}{3}{3}, [1 2 3]);
            this.verifyEqual(this.testObj.testProperty{3}{3}{3}(3), 3);
            this.verifyEqual(this.testObj.testProperty{3}{3}{4}.afield, 'a value');
        end
        function test_dotMethod(this)
            tmp = this.testObj.testMethod(this.testca);
            this.verifyEqual(tmp, this.testca);
            this.verifyEqual(tmp{3}{3}{3}, [1 2 3]);
            this.verifyEqual(tmp{3}{3}{3}(3), 3);
            this.verifyEqual(tmp{3}{3}{4}.afield, 'a value');
        end
	end

 	methods (TestClassSetup)
		function setupCellComposite(this)
 			import mlpatterns.*;
 			this.testObj_ = CellComposite(this.testCA);
            this.testObj_.testProperty = this.testca;
 		end
	end

 	methods (TestMethodSetup)
		function setupCellCompositeTest(this)
 			this.testObj = this.testObj_;
 		end
	end

	properties (Access = 'private')
 		testObj_
 	end

	%  Created with Newcl by John J. Lee after newfcn by Frank Gonzalez-Morphy
 end

