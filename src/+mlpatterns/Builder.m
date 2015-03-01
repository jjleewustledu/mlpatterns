classdef Builder
    %% BUILDER
    %  Consequences.
    %  1.  Allow varying internal representation:   hide the representation & internal structure of product; hide assembly;
    %      new internal representation only if new builder.
    %  2.  Isolate construction:  encapsulate product's internal structure; builder should be sufficient 
    %      for creation & assembly of product.  Make product parts visible to alternative builder-directors.
    %  3.  Build step-by-step:   control from builder-director.  Builder interface localizes the process of 
    %      constructing the product.
    %  Implementation
    %  1.  Builder interface abstracts step-by-step construction.  E.g., appending parts, providing access to parts
    %      built earlier.
    %  2.  Abstract product interfaces unnecessary:  products coupled to concrete builders.
    %  3.  Use empty methods as defaults.
    
    methods
        function this = buildPartA(this)
        end
        function this = buildPartB(this)
        end
        function this = buildPartC(this)
        end
        function prd  = getProduct(~)
            prd = 0;
        end
    end
    
    methods (Access = 'protected')
        function this = Builder()
        end
    end
end