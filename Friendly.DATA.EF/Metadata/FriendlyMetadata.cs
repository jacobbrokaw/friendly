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
		public int OpenFriendshipId { get; set; }
		public string UserId { get; set; }
		public System.DateTime ApplicationDate { get; set; }
		public string ManagerNotes { get; set; }
		public int ApplicationStatus { get; set; }
		public string ResumeFilename { get; set; }
	}
	[MetadataType(typeof(ApplicationMetadata))]
	public partial class Application { }
	#endregion

	#region ApplicationStatus
	public class ApplicationStatusMetadata
	{
		public string StatusName { get; set; }
		public string StatusDescription { get; set; }
	}
	[MetadataType(typeof(ApplicationStatusMetadata))]
	public partial class ApplicationStatus { }
	#endregion

	#region Clique
	public class CliqueMetadata
	{
		public string Name { get; set; }
		public string City { get; set; }
		public string State { get; set; }
		public string BetaId { get; set; }
	}
	[MetadataType(typeof(CliqueMetadata))]
	public partial class Clique { }
	#endregion

	#region Friendship
	public class FriendshipMetadata
	{
		public string Title { get; set; }
		public string Description { get; set; }
	}
	[MetadataType(typeof(FriendshipMetadata))]
	public partial class Friendship { }
	#endregion

	#region OpenFriendship
	public class OpenFriendshipMetadata
	{
		public int FriendshipId { get; set; }
		public int CliqueId { get; set; }
	}
	[MetadataType(typeof(OpenFriendshipMetadata))]
	public partial class OpenFriendship { }
	#endregion

	#region UserDetails
	public class UserDetailsMetadata
	{
		public string UserId { get; set; }
		public string FirstName { get; set; }
		public string LastName { get; set; }
		public string ResumeFilename { get; set; }
	}
	[MetadataType(typeof(UserDetailsMetadata))]
	public partial class UserDetails
	{
		public string FullName
		{
			get { return $"{FirstName} {LastName}"; }
		}
	}
	#endregion
}
