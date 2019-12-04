$(document).ready(function() {
		$('#example').DataTable({
			scrollY: "500px",
		    scrollX: true,
		    scrollCollapse: true,
			dom : 'Bfrtip',
			buttons : [ 
				{
	                extend: 'excel'
	            }, 
				{
                	extend: 'pdf',
                	orientation: 'landscape',
                	pageSize: 'A4',
                	title: 'INCENTIVE REPORT',   
                	customize: function (doc) { doc.defaultStyle.fontSize = 10, doc.styles.tableHeader.fontSize = 6,doc.pageMargins = [3, 3, 3, 3 ] },
                	exportOptions: {
                		columns: [ 0,1,2,3,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,28 ] 
                	}
            	}]
		});
	});