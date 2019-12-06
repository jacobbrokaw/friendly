using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations; // added

namespace Friendly.DATA.EF//.Metadata
{
	#region Application
	public class ApplicationMetadata
	{
		[Required]
		[Display(Name = "Open Friendship")]
		public int OpenFriendshipId { get; set; }

		[Required]
		[Display(Name = "Applicant")]
		public string UserId { get; set; }

		[Required]
		[Display(Name = "Date")]
		[DisplayFormat(DataFormatString = "{0:d}")]
		public System.DateTime ApplicationDate { get; set; }

		[Display(Name = "Superior Notes")]
		[StringLength(2000, ErrorMessage = "Notes must be a maximum 2000 characters")]
		[UIHint("MultilineText")]
		public string ManagerNotes { get; set; }

		[Required]
		[Display(Name = "Status")]
		public int ApplicationStatusId { get; set; }

		[Required]
		[Display(Name = "Resume")]
		public string ResumeFilename { get; set; }
	}
	[MetadataType(typeof(ApplicationMetadata))]
	public partial class Application { }
	#endregion

	#region ApplicationStatus
	public class ApplicationStatusMetadata
	{
		[Required]
		[Display(Name = "Status")]
		public string StatusName { get; set; }

		[Display(Name = "Description")]
		[StringLength(250, ErrorMessage = "The description must be a maximum of 250 characters")]
		public string StatusDescription { get; set; }
	}
	[MetadataType(typeof(ApplicationStatusMetadata))]
	public partial class ApplicationStatus { }
	#endregion

	#region Clique
	public class CliqueMetadata
	{

		[Required]
		[Display(Name = "Clique")]
		[StringLength(25, ErrorMessage = "The name must be a maximum of 25 characters")]
		public string Name { get; set; }

		[Required]
		[StringLength(50, ErrorMessage = "The city must be a maximum of 50 characters")]
		public string City { get; set; }

		[Required]
		[StringLength(2, ErrorMessage = "Please use the two letter state abbreviation", MinimumLength = 2)]
		public string State { get; set; }

		[Required]
		[Display(Name = "Superior")]
		public string BetaId { get; set; }

	}
	[MetadataType(typeof(CliqueMetadata))]
	public partial class Clique
	{
		public string Location
		{
			get { return $"{City}, {State}"; }
		}
	}
	#endregion

	#region Friendship
	public class FriendshipMetadata
	{

		[Required]
		[Display(Name = "Friendship")]
		[StringLength(50, ErrorMessage = "The friendship must be a maximum of 50 characters")]
		public string Title { get; set; }

		[Required]
		[UIHint("MultilineText")]
		public string Description { get; set; }
	}
	[MetadataType(typeof(FriendshipMetadata))]
	public partial class Friendship { }
	#endregion

	#region OpenFriendship
	public class OpenFriendshipMetadata
	{
		[Required]
		[Display(Name = "Friendship")]
		public int FriendshipId { get; set; }

		[Required]
		[Display(Name = "Clique")]
		public int CliqueId { get; set; }
	}
	[MetadataType(typeof(OpenFriendshipMetadata))]
	public partial class OpenFriendship { }
	#endregion

	#region UserDetail
	public class UserDetailMetadata
	{
		[Required]
		[Display(Name = "First Name")]
		[StringLength(50, ErrorMessage = "First name must be a maximum of 50 characters")]
		public string FirstName { get; set; }

		[Required]
		[Display(Name = "Last Name")]
		[StringLength(50, ErrorMessage = "Last name must be a maximum of 50 characters")]
		public string LastName { get; set; }

		[Display(Name = "Resume")]
		public string ResumeFilename { get; set; }
	}
	[MetadataType(typeof(UserDetailMetadata))]
	public partial class UserDetail
	{
		[Display(Name = "Full Name")]
		public string FullName
		{
			get { return $"{FirstName} {LastName}"; }
		}
	}
	#endregion
}
