<?xml version='1.0' encoding='UTF-8' standalone='yes' ?>
<tagfile doxygen_version="1.12.0">
  <compound kind="file">
    <name>compute.hpp</name>
    <path>irlba/</path>
    <filename>compute_8hpp.html</filename>
    <includes id="simple_8hpp" name="simple.hpp" local="yes" import="no" module="no" objc="no">Matrix/simple.hpp</includes>
    <class kind="struct">irlba::Results</class>
  </compound>
  <compound kind="file">
    <name>centered.hpp</name>
    <path>irlba/Matrix/</path>
    <filename>centered_8hpp.html</filename>
    <includes id="interface_8hpp" name="interface.hpp" local="yes" import="no" module="no" objc="no">interface.hpp</includes>
    <class kind="class">irlba::CenteredMatrix</class>
  </compound>
  <compound kind="file">
    <name>interface.hpp</name>
    <path>irlba/Matrix/</path>
    <filename>interface_8hpp.html</filename>
    <class kind="class">irlba::Workspace</class>
    <class kind="class">irlba::AdjointWorkspace</class>
    <class kind="class">irlba::RealizeWorkspace</class>
    <class kind="class">irlba::Matrix</class>
  </compound>
  <compound kind="file">
    <name>scaled.hpp</name>
    <path>irlba/Matrix/</path>
    <filename>scaled_8hpp.html</filename>
    <includes id="interface_8hpp" name="interface.hpp" local="yes" import="no" module="no" objc="no">interface.hpp</includes>
  </compound>
  <compound kind="file">
    <name>simple.hpp</name>
    <path>irlba/Matrix/</path>
    <filename>simple_8hpp.html</filename>
    <includes id="interface_8hpp" name="interface.hpp" local="yes" import="no" module="no" objc="no">interface.hpp</includes>
    <class kind="class">irlba::SimpleMatrix</class>
  </compound>
  <compound kind="file">
    <name>sparse.hpp</name>
    <path>irlba/Matrix/</path>
    <filename>sparse_8hpp.html</filename>
    <includes id="parallel_8hpp" name="parallel.hpp" local="yes" import="no" module="no" objc="no">../parallel.hpp</includes>
    <includes id="interface_8hpp" name="interface.hpp" local="yes" import="no" module="no" objc="no">interface.hpp</includes>
    <class kind="class">irlba::ParallelSparseWorkspace</class>
    <class kind="class">irlba::ParallelSparseAdjointWorkspace</class>
    <class kind="class">irlba::ParallelSparseRealizeWorkspace</class>
    <class kind="class">irlba::ParallelSparseMatrix</class>
  </compound>
  <compound kind="file">
    <name>Options.hpp</name>
    <path>irlba/</path>
    <filename>Options_8hpp.html</filename>
    <class kind="struct">irlba::Options</class>
  </compound>
  <compound kind="file">
    <name>parallel.hpp</name>
    <path>irlba/</path>
    <filename>parallel_8hpp.html</filename>
    <class kind="class">irlba::EigenThreadScope</class>
  </compound>
  <compound kind="file">
    <name>pca.hpp</name>
    <path>irlba/</path>
    <filename>pca_8hpp.html</filename>
    <includes id="compute_8hpp" name="compute.hpp" local="yes" import="no" module="no" objc="no">compute.hpp</includes>
    <includes id="simple_8hpp" name="simple.hpp" local="yes" import="no" module="no" objc="no">Matrix/simple.hpp</includes>
    <includes id="centered_8hpp" name="centered.hpp" local="yes" import="no" module="no" objc="no">Matrix/centered.hpp</includes>
    <includes id="scaled_8hpp" name="scaled.hpp" local="yes" import="no" module="no" objc="no">Matrix/scaled.hpp</includes>
    <class kind="struct">irlba::PcaResults</class>
  </compound>
  <compound kind="class">
    <name>irlba::AdjointWorkspace</name>
    <filename>classirlba_1_1AdjointWorkspace.html</filename>
    <templarg>class EigenVector_</templarg>
    <member kind="function" virtualness="pure">
      <type>virtual void</type>
      <name>multiply</name>
      <anchorfile>classirlba_1_1AdjointWorkspace.html</anchorfile>
      <anchor>a586c1f21819b781503a58c87249c3b63</anchor>
      <arglist>(const EigenVector_ &amp;right, EigenVector_ &amp;output)=0</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>irlba::CenteredMatrix</name>
    <filename>classirlba_1_1CenteredMatrix.html</filename>
    <templarg>class EigenVector_</templarg>
    <templarg>class EigenMatrix_</templarg>
    <templarg>class MatrixPointer_</templarg>
    <templarg>class CenterPointer_</templarg>
    <base>irlba::Matrix&lt; EigenVector_, EigenMatrix_ &gt;</base>
    <member kind="function">
      <type></type>
      <name>CenteredMatrix</name>
      <anchorfile>classirlba_1_1CenteredMatrix.html</anchorfile>
      <anchor>a96d8f2c6d97030e86f23c7256b70e556</anchor>
      <arglist>(MatrixPointer_ matrix, CenterPointer_ center)</arglist>
    </member>
    <member kind="function">
      <type>Eigen::Index</type>
      <name>rows</name>
      <anchorfile>classirlba_1_1CenteredMatrix.html</anchorfile>
      <anchor>a7bd996660d56400904d1191d3d9dee96</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>Eigen::Index</type>
      <name>cols</name>
      <anchorfile>classirlba_1_1CenteredMatrix.html</anchorfile>
      <anchor>a2ccca89f9ed6d8a609503b0833cc945b</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>std::unique_ptr&lt; Workspace&lt; EigenVector_ &gt; &gt;</type>
      <name>new_workspace</name>
      <anchorfile>classirlba_1_1CenteredMatrix.html</anchorfile>
      <anchor>a7dbbce4a13a2ef4051fe223a8cb8183f</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>std::unique_ptr&lt; AdjointWorkspace&lt; EigenVector_ &gt; &gt;</type>
      <name>new_adjoint_workspace</name>
      <anchorfile>classirlba_1_1CenteredMatrix.html</anchorfile>
      <anchor>acd389d1385dacd65330aa3b8c6f7718e</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>std::unique_ptr&lt; RealizeWorkspace&lt; EigenMatrix_ &gt; &gt;</type>
      <name>new_realize_workspace</name>
      <anchorfile>classirlba_1_1CenteredMatrix.html</anchorfile>
      <anchor>abc897e918a23c24eeaedfe43760d151f</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>auto</type>
      <name>new_known_workspace</name>
      <anchorfile>classirlba_1_1CenteredMatrix.html</anchorfile>
      <anchor>a12de215aa3aec2c16c6be3061aac4d9c</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>auto</type>
      <name>new_known_adjoint_workspace</name>
      <anchorfile>classirlba_1_1CenteredMatrix.html</anchorfile>
      <anchor>a37043751834697c631868c3170a1c399</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>auto</type>
      <name>new_known_realize_workspace</name>
      <anchorfile>classirlba_1_1CenteredMatrix.html</anchorfile>
      <anchor>a415d1e6dbe8b8752dda54b263e55f385</anchor>
      <arglist>() const</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>irlba::EigenThreadScope</name>
    <filename>classirlba_1_1EigenThreadScope.html</filename>
    <member kind="function">
      <type></type>
      <name>EigenThreadScope</name>
      <anchorfile>classirlba_1_1EigenThreadScope.html</anchorfile>
      <anchor>a5bed6285b3da4aba87eeaf3cddbef1c1</anchor>
      <arglist>(int num_threads)</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>irlba::Matrix</name>
    <filename>classirlba_1_1Matrix.html</filename>
    <templarg>class EigenVector_</templarg>
    <templarg>class EigenMatrix_</templarg>
    <member kind="function" virtualness="pure">
      <type>virtual Eigen::Index</type>
      <name>rows</name>
      <anchorfile>classirlba_1_1Matrix.html</anchorfile>
      <anchor>a445f7873a357819428df497c3ed69a33</anchor>
      <arglist>() const =0</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual Eigen::Index</type>
      <name>cols</name>
      <anchorfile>classirlba_1_1Matrix.html</anchorfile>
      <anchor>a501fe6e1d2f916d46239529e731da328</anchor>
      <arglist>() const =0</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual std::unique_ptr&lt; Workspace&lt; EigenVector_ &gt; &gt;</type>
      <name>new_workspace</name>
      <anchorfile>classirlba_1_1Matrix.html</anchorfile>
      <anchor>a6abf35c662b5f18dddfa1a5e68a3d227</anchor>
      <arglist>() const =0</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual std::unique_ptr&lt; AdjointWorkspace&lt; EigenVector_ &gt; &gt;</type>
      <name>new_adjoint_workspace</name>
      <anchorfile>classirlba_1_1Matrix.html</anchorfile>
      <anchor>a21e0ea4abfe872d6c0d6730a997db828</anchor>
      <arglist>() const =0</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual std::unique_ptr&lt; RealizeWorkspace&lt; EigenMatrix_ &gt; &gt;</type>
      <name>new_realize_workspace</name>
      <anchorfile>classirlba_1_1Matrix.html</anchorfile>
      <anchor>a34bc2683917efaf71525446eef8b7786</anchor>
      <arglist>() const =0</arglist>
    </member>
    <member kind="function">
      <type>std::unique_ptr&lt; Workspace&lt; EigenVector_ &gt; &gt;</type>
      <name>new_known_workspace</name>
      <anchorfile>classirlba_1_1Matrix.html</anchorfile>
      <anchor>af4069e1f696ae7495d1b495d08fd57a1</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>std::unique_ptr&lt; AdjointWorkspace&lt; EigenVector_ &gt; &gt;</type>
      <name>new_known_adjoint_workspace</name>
      <anchorfile>classirlba_1_1Matrix.html</anchorfile>
      <anchor>a4d24b11b4a1f7082f88fae5dfc70edd4</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>std::unique_ptr&lt; RealizeWorkspace&lt; EigenMatrix_ &gt; &gt;</type>
      <name>new_known_realize_workspace</name>
      <anchorfile>classirlba_1_1Matrix.html</anchorfile>
      <anchor>a9a4da990893ff44f8b2039d2acfa4332</anchor>
      <arglist>() const</arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>irlba::Options</name>
    <filename>structirlba_1_1Options.html</filename>
    <templarg>class EigenVector_</templarg>
    <member kind="variable">
      <type>double</type>
      <name>invariant_subspace_tolerance</name>
      <anchorfile>structirlba_1_1Options.html</anchorfile>
      <anchor>ab6e3d538d647a3c72b7ea655c7486a57</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>double</type>
      <name>convergence_tolerance</name>
      <anchorfile>structirlba_1_1Options.html</anchorfile>
      <anchor>a019f546a47e990071416a11687c14d71</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>double</type>
      <name>singular_value_ratio_tolerance</name>
      <anchorfile>structirlba_1_1Options.html</anchorfile>
      <anchor>a9b8e78abc2333d8b7a9ee9a0635e3f02</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>int</type>
      <name>extra_work</name>
      <anchorfile>structirlba_1_1Options.html</anchorfile>
      <anchor>a179a747996c1a3d4fbf89215d97334d1</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>int</type>
      <name>max_iterations</name>
      <anchorfile>structirlba_1_1Options.html</anchorfile>
      <anchor>a5f53aad8e0d9b6d1a1a9647413f638fa</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>bool</type>
      <name>exact_for_small_matrix</name>
      <anchorfile>structirlba_1_1Options.html</anchorfile>
      <anchor>a85195d98803d717976c17b267708af4f</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>bool</type>
      <name>exact_for_large_number</name>
      <anchorfile>structirlba_1_1Options.html</anchorfile>
      <anchor>a1924053077a1dac0332c139776faf6d3</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>bool</type>
      <name>cap_number</name>
      <anchorfile>structirlba_1_1Options.html</anchorfile>
      <anchor>a95fbe9c985391959881f1107a87320bc</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>std::mt19937_64::result_type</type>
      <name>seed</name>
      <anchorfile>structirlba_1_1Options.html</anchorfile>
      <anchor>afb7a12a2d949da2399a30b2aca10fa62</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>std::optional&lt; EigenVector_ &gt;</type>
      <name>initial</name>
      <anchorfile>structirlba_1_1Options.html</anchorfile>
      <anchor>a83537f6e35482091fd60fc61b7b53714</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>irlba::ParallelSparseAdjointWorkspace</name>
    <filename>classirlba_1_1ParallelSparseAdjointWorkspace.html</filename>
    <templarg>class EigenVector_</templarg>
    <templarg>class ValueArray_</templarg>
    <templarg>class IndexArray_</templarg>
    <templarg>class PointerArray_</templarg>
    <base>irlba::AdjointWorkspace&lt; EigenVector_ &gt;</base>
    <member kind="function">
      <type>void</type>
      <name>multiply</name>
      <anchorfile>classirlba_1_1ParallelSparseAdjointWorkspace.html</anchorfile>
      <anchor>a6e8b220c427cbbc75d2d3bc00f804d88</anchor>
      <arglist>(const EigenVector_ &amp;right, EigenVector_ &amp;output)</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>irlba::ParallelSparseMatrix</name>
    <filename>classirlba_1_1ParallelSparseMatrix.html</filename>
    <templarg>class EigenVector_</templarg>
    <templarg>class EigenMatrix_</templarg>
    <templarg>class ValueArray_</templarg>
    <templarg>class IndexArray_</templarg>
    <templarg>class PointerArray_</templarg>
    <base>irlba::Matrix&lt; EigenVector_, EigenMatrix_ &gt;</base>
    <member kind="typedef">
      <type>I&lt; decltype(std::declval&lt; PointerArray_ &gt;()[0])&gt;</type>
      <name>PointerType</name>
      <anchorfile>classirlba_1_1ParallelSparseMatrix.html</anchorfile>
      <anchor>a812d625d449ea75df1b42428a0d09c03</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>ParallelSparseMatrix</name>
      <anchorfile>classirlba_1_1ParallelSparseMatrix.html</anchorfile>
      <anchor>a95f1f0793968638d2a7086beb2b6dab2</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>ParallelSparseMatrix</name>
      <anchorfile>classirlba_1_1ParallelSparseMatrix.html</anchorfile>
      <anchor>a396d19eeb0b384636072b6fe41512ad0</anchor>
      <arglist>(Eigen::Index nrow, Eigen::Index ncol, ValueArray_ x, IndexArray_ i, PointerArray_ p, bool column_major, int num_threads)</arglist>
    </member>
    <member kind="function">
      <type>Eigen::Index</type>
      <name>rows</name>
      <anchorfile>classirlba_1_1ParallelSparseMatrix.html</anchorfile>
      <anchor>a7ea7b264d343553c52cb4e0a04bf0cf9</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>Eigen::Index</type>
      <name>cols</name>
      <anchorfile>classirlba_1_1ParallelSparseMatrix.html</anchorfile>
      <anchor>a4384154be9eb26ee6d789e749c33390f</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>const ValueArray_ &amp;</type>
      <name>get_values</name>
      <anchorfile>classirlba_1_1ParallelSparseMatrix.html</anchorfile>
      <anchor>a78d57d5921d40f01a45543bb6b9cd277</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>const IndexArray_ &amp;</type>
      <name>get_indices</name>
      <anchorfile>classirlba_1_1ParallelSparseMatrix.html</anchorfile>
      <anchor>adaf070a354be6f2d65263864cc3cea15</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>const PointerArray_ &amp;</type>
      <name>get_pointers</name>
      <anchorfile>classirlba_1_1ParallelSparseMatrix.html</anchorfile>
      <anchor>ad28e10195596f59f6f089c1e89f3f2ea</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>const std::vector&lt; Eigen::Index &gt; &amp;</type>
      <name>get_primary_boundaries</name>
      <anchorfile>classirlba_1_1ParallelSparseMatrix.html</anchorfile>
      <anchor>a40caa4287650837e5b149e8b5ae37219</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>const std::vector&lt; Eigen::Index &gt; &amp;</type>
      <name>get_secondary_boundaries</name>
      <anchorfile>classirlba_1_1ParallelSparseMatrix.html</anchorfile>
      <anchor>af0ae59f466ead930a77a3f771a9aae8e</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>const std::vector&lt; std::vector&lt; PointerType &gt; &gt; &amp;</type>
      <name>get_secondary_nonzero_boundaries</name>
      <anchorfile>classirlba_1_1ParallelSparseMatrix.html</anchorfile>
      <anchor>ac48259f75c9588d8d9698edf0b804904</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>std::unique_ptr&lt; Workspace&lt; EigenVector_ &gt; &gt;</type>
      <name>new_workspace</name>
      <anchorfile>classirlba_1_1ParallelSparseMatrix.html</anchorfile>
      <anchor>adf44a97e086bb8446961ff36faa9f509</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>std::unique_ptr&lt; AdjointWorkspace&lt; EigenVector_ &gt; &gt;</type>
      <name>new_adjoint_workspace</name>
      <anchorfile>classirlba_1_1ParallelSparseMatrix.html</anchorfile>
      <anchor>a7d9b58d608a2b2b8a8b8cbb4b9e41ce8</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>std::unique_ptr&lt; RealizeWorkspace&lt; EigenMatrix_ &gt; &gt;</type>
      <name>new_realize_workspace</name>
      <anchorfile>classirlba_1_1ParallelSparseMatrix.html</anchorfile>
      <anchor>a9d7a53e223d10e5e5863a24f3ab82b4e</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>auto</type>
      <name>new_known_workspace</name>
      <anchorfile>classirlba_1_1ParallelSparseMatrix.html</anchorfile>
      <anchor>afe060af21facc6bbd2b4878c6b51395c</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>auto</type>
      <name>new_known_adjoint_workspace</name>
      <anchorfile>classirlba_1_1ParallelSparseMatrix.html</anchorfile>
      <anchor>aa26b205b2c5abcd54fd89097f822719a</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>auto</type>
      <name>new_known_realize_workspace</name>
      <anchorfile>classirlba_1_1ParallelSparseMatrix.html</anchorfile>
      <anchor>af2e2da22ec34e66212dc5b4aa32904f4</anchor>
      <arglist>() const</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>irlba::ParallelSparseRealizeWorkspace</name>
    <filename>classirlba_1_1ParallelSparseRealizeWorkspace.html</filename>
    <templarg>class EigenMatrix_</templarg>
    <templarg>class ValueArray_</templarg>
    <templarg>class IndexArray_</templarg>
    <templarg>class PointerArray_</templarg>
    <base>irlba::RealizeWorkspace&lt; EigenMatrix_ &gt;</base>
    <member kind="function">
      <type>const EigenMatrix_ &amp;</type>
      <name>realize</name>
      <anchorfile>classirlba_1_1ParallelSparseRealizeWorkspace.html</anchorfile>
      <anchor>a7f1d0da3da9d067a53cd08006a7affb6</anchor>
      <arglist>(EigenMatrix_ &amp;buffer)</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>irlba::ParallelSparseWorkspace</name>
    <filename>classirlba_1_1ParallelSparseWorkspace.html</filename>
    <templarg>class EigenVector_</templarg>
    <templarg>class ValueArray_</templarg>
    <templarg>class IndexArray_</templarg>
    <templarg>class PointerArray_</templarg>
    <base>irlba::Workspace&lt; EigenVector_ &gt;</base>
    <member kind="function">
      <type>void</type>
      <name>multiply</name>
      <anchorfile>classirlba_1_1ParallelSparseWorkspace.html</anchorfile>
      <anchor>ad3fc5f626b0bb46c158b5815be9d8482</anchor>
      <arglist>(const EigenVector_ &amp;right, EigenVector_ &amp;output)</arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>irlba::PcaResults</name>
    <filename>structirlba_1_1PcaResults.html</filename>
    <templarg>class EigenMatrix_</templarg>
    <templarg>class EigenVector_</templarg>
    <member kind="variable">
      <type>EigenMatrix_</type>
      <name>scores</name>
      <anchorfile>structirlba_1_1PcaResults.html</anchorfile>
      <anchor>a7d882ecc1895491df377de953477f662</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>EigenMatrix_</type>
      <name>rotation</name>
      <anchorfile>structirlba_1_1PcaResults.html</anchorfile>
      <anchor>ab97a992b7080c77cee1b4e349edf2521</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>EigenVector_</type>
      <name>variances</name>
      <anchorfile>structirlba_1_1PcaResults.html</anchorfile>
      <anchor>ab175b5cb7799e7ca44182cd447699071</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>int</type>
      <name>iterations</name>
      <anchorfile>structirlba_1_1PcaResults.html</anchorfile>
      <anchor>abdc9a3e29efba76992af948627bbbe89</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>bool</type>
      <name>converged</name>
      <anchorfile>structirlba_1_1PcaResults.html</anchorfile>
      <anchor>abe63e04a2765cce76a32b47d39561a1d</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>irlba::RealizeWorkspace</name>
    <filename>classirlba_1_1RealizeWorkspace.html</filename>
    <templarg>class EigenMatrix_</templarg>
    <member kind="function" virtualness="pure">
      <type>virtual const EigenMatrix_ &amp;</type>
      <name>realize</name>
      <anchorfile>classirlba_1_1RealizeWorkspace.html</anchorfile>
      <anchor>a8596db8855716e629a8510ac6e12e71e</anchor>
      <arglist>(EigenMatrix_ &amp;buffer)=0</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>realize_copy</name>
      <anchorfile>classirlba_1_1RealizeWorkspace.html</anchorfile>
      <anchor>afbd1cdc749cdca173d5659bb9a8718c1</anchor>
      <arglist>(EigenMatrix_ &amp;buffer)</arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>irlba::Results</name>
    <filename>structirlba_1_1Results.html</filename>
    <templarg>class EigenMatrix_</templarg>
    <templarg>class EigenVector_</templarg>
    <member kind="variable">
      <type>EigenMatrix_</type>
      <name>U</name>
      <anchorfile>structirlba_1_1Results.html</anchorfile>
      <anchor>a59ab34dac65eb90e6886b8a7df6ec245</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>EigenMatrix_</type>
      <name>V</name>
      <anchorfile>structirlba_1_1Results.html</anchorfile>
      <anchor>a6559892535ea2ba3b80bfd101e979f3b</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>EigenVector_</type>
      <name>D</name>
      <anchorfile>structirlba_1_1Results.html</anchorfile>
      <anchor>a21b7e432392523d3e6693701751a4cfc</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>int</type>
      <name>iterations</name>
      <anchorfile>structirlba_1_1Results.html</anchorfile>
      <anchor>a5788fc587a38a96d46bd75bc6c180559</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>bool</type>
      <name>converged</name>
      <anchorfile>structirlba_1_1Results.html</anchorfile>
      <anchor>a867a16b6a3c46b48deea9a17dd4e20b9</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>irlba::SimpleMatrix</name>
    <filename>classirlba_1_1SimpleMatrix.html</filename>
    <templarg>class EigenVector_</templarg>
    <templarg>class EigenMatrix_</templarg>
    <templarg>class SimplePointer_</templarg>
    <base>irlba::Matrix&lt; EigenVector_, EigenMatrix_ &gt;</base>
    <member kind="function">
      <type></type>
      <name>SimpleMatrix</name>
      <anchorfile>classirlba_1_1SimpleMatrix.html</anchorfile>
      <anchor>a40ad6109c43db9aae47c10eb731039c6</anchor>
      <arglist>(SimplePointer_ matrix)</arglist>
    </member>
    <member kind="function">
      <type>Eigen::Index</type>
      <name>rows</name>
      <anchorfile>classirlba_1_1SimpleMatrix.html</anchorfile>
      <anchor>a61f8ae12917ce7029309a94bcd19076a</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>Eigen::Index</type>
      <name>cols</name>
      <anchorfile>classirlba_1_1SimpleMatrix.html</anchorfile>
      <anchor>abea605d297da66b88ac041d8312803c6</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>std::unique_ptr&lt; Workspace&lt; EigenVector_ &gt; &gt;</type>
      <name>new_workspace</name>
      <anchorfile>classirlba_1_1SimpleMatrix.html</anchorfile>
      <anchor>a4d828993e46ab39f37647d8d77b6b86b</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>std::unique_ptr&lt; AdjointWorkspace&lt; EigenVector_ &gt; &gt;</type>
      <name>new_adjoint_workspace</name>
      <anchorfile>classirlba_1_1SimpleMatrix.html</anchorfile>
      <anchor>a4722a76b2cf4c2c78131b0f0e0c96878</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>std::unique_ptr&lt; RealizeWorkspace&lt; EigenMatrix_ &gt; &gt;</type>
      <name>new_realize_workspace</name>
      <anchorfile>classirlba_1_1SimpleMatrix.html</anchorfile>
      <anchor>acde47445ae7eb9e599c6fbd1b34b14ea</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>auto</type>
      <name>new_known_workspace</name>
      <anchorfile>classirlba_1_1SimpleMatrix.html</anchorfile>
      <anchor>af37dae4d9cdc7f92f6f0f1d4d09112c7</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>auto</type>
      <name>new_known_adjoint_workspace</name>
      <anchorfile>classirlba_1_1SimpleMatrix.html</anchorfile>
      <anchor>a0a1adc976358e3c623baac97b6c4a860</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>auto</type>
      <name>new_known_realize_workspace</name>
      <anchorfile>classirlba_1_1SimpleMatrix.html</anchorfile>
      <anchor>a965f609a2c22bc9222ebef855391d770</anchor>
      <arglist>() const</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>irlba::Workspace</name>
    <filename>classirlba_1_1Workspace.html</filename>
    <templarg>class EigenVector_</templarg>
    <member kind="function" virtualness="pure">
      <type>virtual void</type>
      <name>multiply</name>
      <anchorfile>classirlba_1_1Workspace.html</anchorfile>
      <anchor>aace68ce16da70c397d4a790f3667ae35</anchor>
      <arglist>(const EigenVector_ &amp;right, EigenVector_ &amp;output)=0</arglist>
    </member>
  </compound>
  <compound kind="page">
    <name>index</name>
    <title>C++ library for IRLBA</title>
    <filename>index.html</filename>
    <docanchor file="index.html" title="C++ library for IRLBA">md__2github_2workspace_2README</docanchor>
  </compound>
</tagfile>
